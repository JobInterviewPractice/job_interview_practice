import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:job_interview_practice/core/local_storage/db_wrapper.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_next_bloc.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';
import 'package:path_provider/path_provider.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() {
    return _CameraWidgetState();
  }
}

class _CameraWidgetState extends State<CameraWidget> {
  Box<RecordingModel> recordingsBox;
  CameraController controller;
  String videoPath;
  List<CameraDescription> cameras;
  int selectedCameraIdx;

  @override
  void initState() {
    super.initState();
    recordingsBox = Hive.box<RecordingModel>(RECORDINGS);
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          final cameraIndex = cameras.indexWhere((element) => element.lensDirection == CameraLensDirection.front);
          selectedCameraIdx = cameraIndex < 0 ? 0 : cameraIndex;
        });

        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {
          if (controller != null && controller.value.isInitialized && !controller.value.isRecordingVideo) {
            _onRecordButtonPressed();
          }
        });
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartNextBloc, StartState>(
      listener: (_, state) {
        if (state is FinishQuestionState &&
            controller != null &&
            controller.value.isInitialized &&
            controller.value.isRecordingVideo) {
          _onStopButtonPressed();
        }
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (controller != null && controller.value.isRecordingVideo) ...[
                Text(controller != null && controller.value.isRecordingVideo ? 'REC' : ''),
                Icon(
                  Icons.circle,
                  color: Colors.red,
                )
              ],
            ],
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Center(
                  child: _cameraPreviewWidget(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Display 'Loading' text when the camera is still loading.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        _showSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {
        _showSnackBar('Recording video started');
      }
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      _showSnackBar('Video saved to $videoPath');
      final state = BlocProvider.of<StartNextBloc>(context).state;
      if (state is FinishQuestionState) {
        final model = RecordingModel(
          questions: state.questions.map((e) => e.questionText).toList(),
          videoPath: videoPath
        );
        recordingsBox.add(model);
      }
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      _showSnackBar('Please wait');
      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    _showSnackBar('Error: ${e.code}\n${e.description}');
  }

  void _showSnackBar(String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
