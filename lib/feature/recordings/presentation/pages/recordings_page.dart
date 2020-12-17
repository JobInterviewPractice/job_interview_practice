import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/recordings/presentation/bloc/recordings_bloc.dart';
import 'package:job_interview_practice/feature/recordings/presentation/pages/recording_details_page.dart';

class RecordingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<RecordingsBloc>(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: MyAppBar(
            appBarTitle: "Recordings",
          ),
          body: BlocBuilder<RecordingsBloc, RecordingsState>(builder: (context, state) {
            if (state is Recordings) {
              return ListView.separated(
                itemCount: state.models.length,
                separatorBuilder: (_, __) {
                  return Divider();
                },
                itemBuilder: (_, index) {
                  final item = state.models[index];
                  return ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(item.title),
                    subtitle: Text("Answered on ${item.model.questions.length} questions"),
                    trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text(
                                  'Play',
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text('Delete'),
                              ),
                            ],
                        onSelected: (index) {
                          switch (index) {
                            case 1:
                              Navigator.push(context, MaterialPageRoute(builder: (_) => RecodingDetailsPage(item)));
                              break;
                            case 2:
                              BlocProvider.of<RecordingsBloc>(context).add(DeleteRecording(item.model.videoPath));
                              break;
                          }
                        },
                        child: Icon(
                          Icons.more_vert,
                          size: 28,
                          color: Colors.black,
                        )),
                  );
                },
              );
            } else if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
