import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String path;
  VideoWidget(this.path);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.file(File(widget.path));
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: videoPlayerController.initialize(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Chewie(
              controller: ChewieController(
                videoPlayerController: videoPlayerController,
                autoPlay: true,
                looping: true,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
