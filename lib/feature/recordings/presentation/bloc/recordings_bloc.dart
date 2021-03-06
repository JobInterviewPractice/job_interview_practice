import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/recordings/domain/usecases/delete_recording_use_case.dart';
import 'package:job_interview_practice/feature/recordings/domain/usecases/get_recordings_usecase.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';
import 'package:meta/meta.dart';

part 'recordings_event.dart';
part 'recordings_state.dart';

class RecordingsBloc extends Bloc<RecordingsEvent, RecordingsState> {
  final GetRecordingsUseCase getRecordingsUseCase;
  final DeleteRecordingUseCase deleteRecordingUseCase;

  RecordingsBloc({this.getRecordingsUseCase, this.deleteRecordingUseCase}) : super(RecordingsInitial()) {
    add(RecordingsEvent());
  }

  @override
  Stream<RecordingsState> mapEventToState(RecordingsEvent event) async* {
    if (event is DeleteRecording) {
      await deleteRecordingUseCase(event.recordingId);
    }

    final result = await getRecordingsUseCase(NoInput());
    yield* result.fold((l) async* {
      yield Error(l.message);
    }, (r) async* {
      final formatter = DateFormat('yyyy-MM-dd, HH:mm EEE');
      final items = r.map((e) {
        final dateString = e.videoPath.split('/').last.replaceAll('.mp4', '');
        final dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(dateString));
        return RecordingItem(e, formatter.format(dateTime));
      }).toList();
      yield Recordings(items);
    });
  }
}
