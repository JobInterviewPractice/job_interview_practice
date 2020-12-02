import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/camera_widget.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_next_bloc.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';
import 'package:job_interview_practice/feature/start/presentation/widgets/start_image.dart';

import '../../../../main.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<StartNextBloc>(),
      child: Scaffold(
        appBar: MyAppBar(appBarTitle: "Get The Job!"),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            BlocBuilder<StartNextBloc, StartState>(
              builder: (context, state) {
                if (state is LoadedStartState || state is FinishQuestionState) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54, width: 3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  if (state is LoadedStartState) ...[
                                    Text(
                                      "Answering: ${state.numberOfAnswering}/${state.totalNumber}",
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    ),
                                    Text(
                                      state.question.questionText,
                                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                  if (state is FinishQuestionState) ...[
                                    Text(
                                      "Finished!",
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                        // todo: insert this!!!
                        StartImage(),

                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                              child: CameraWidget(),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("CHECK WEAK QUESTION"),
                            // todo: impl to data store
                            Switch(value: false, onChanged: (newvalue) => false)
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                if (state is LoadedStartState) ...[
                                  ButtonTheme(
                                    height: 50,
                                    minWidth: 120,
                                    child: RaisedButton(
                                      color: Colors.teal,
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: Text(
                                        'Exit',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                      shape: const StadiumBorder(),
                                    ),
                                  ),
                                  ButtonTheme(
                                    height: 50,
                                    minWidth: 120,
                                    child: RaisedButton(
                                      color: Colors.teal,
                                      shape: const StadiumBorder(),
                                      onPressed: () =>
                                          {BlocProvider.of<StartNextBloc>(context).add(NextQuestionEvent())},
                                      child: Text(
                                        'Next',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  )
                                ],
                                if (state is FinishQuestionState) ...[
                                  ButtonTheme(
                                    height: 50,
                                    minWidth: 120,
                                    child: RaisedButton(
                                      color: Colors.teal,
                                      shape: const StadiumBorder(),
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'Top',
                                        style: TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
