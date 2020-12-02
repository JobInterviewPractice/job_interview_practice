import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/video_widget.dart';
import 'package:job_interview_practice/feature/recordings/presentation/bloc/recordings_bloc.dart';
import 'package:video_player/video_player.dart';

class RecodingDetailsPage extends StatelessWidget {
  final RecordingItem item;
  RecodingDetailsPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: item.title,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: VideoWidget(item.model.videoPath)),
          Divider(),
          Container(
            margin: const EdgeInsets.only(top: 8, left: 20, bottom: 8),
            child: Text("Questions:"),
          ),
          Divider(),
          Expanded(
              child: ListView.separated(
            itemCount: item.model.questions.length,
            separatorBuilder: (_, index) {
              return Divider();
            },
            itemBuilder: (_, index) {
              final model = item.model.questions[index];
              return ListTile(
                leading: Text(index.toString()),
                title: Text(model),
              );
            },
          ))
        ],
      ),
    );
  }
}
