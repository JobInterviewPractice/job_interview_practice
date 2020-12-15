import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/recordings/presentation/bloc/recordings_bloc.dart';
import 'package:job_interview_practice/feature/recordings/presentation/pages/recording_details_page.dart';

class RecordingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBarTitle: "Recordings",
      ),
      //Dismissible
      body: BlocBuilder<RecordingsBloc, RecordingsState>(
          cubit: serviceLocator<RecordingsBloc>(),
          builder: (context, state) {
            if (state is Recordings) {
              return ListView.separated(
                itemCount: state.models.length,
                separatorBuilder: (_, __) {
                  return Divider();
                },
                itemBuilder: (_, index) {
                  final item = state.models[index];
                  return ListTile(
                    leading: Text(index.toString()),
                    title: Text(item.title),
                    subtitle: Text(
                        "Answered on ${item.model.questions.length} questions"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.play_arrow_outlined,
                            size: 25.0,
                            color: Colors.brown[900],
                          ),
                          onPressed: () {
                            //   _onDeleteItemPressed(index);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RecodingDetailsPage(item)));
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            size: 20.0,
                            color: Colors.brown[900],
                          ),
                          onPressed: () {
                            state.models.removeAt(index);
                            //   _onDeleteItemPressed(index);
                          },
                        ),
                      ],
                    ),
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
    );
  }
}
