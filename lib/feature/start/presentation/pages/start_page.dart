import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_next_bloc.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<StartNextBloc>(),
      child: Scaffold(
        appBar: MyAppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            BlocBuilder<StartNextBloc, StartState>(
              builder: (context, state) {
                if (state is LoadedStartState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
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
                                Text(
                                  "Answering: ${state.numberOfAnswering}/${state.totalNumber}",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                ),
                                Text(
                                  state.question.questionText,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // todo: insert this!!!
                      StartImage(),
                      Container(
                        padding: EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            Text(
                              "REC",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                          child: Container(
                            color: Colors.yellow,
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
                        padding: EdgeInsets.all(32.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ButtonTheme(
                                height: 50,
                                minWidth: 120,
                                child: RaisedButton(
                                  color: Colors.teal,
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Exit',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  shape: const StadiumBorder(),
                                ),
                              ),
                              BlocBuilder<StartNextBloc, StartState>(
                                builder: (context, state) {
                                  return ButtonTheme(
                                    height: 50,
                                    minWidth: 120,
                                    child: RaisedButton(
                                      color: Colors.teal,
                                      shape: const StadiumBorder(),
                                      onPressed: () => {
                                        BlocProvider.of<StartNextBloc>(context)
                                            .add(NextQuestionEvent())
                                      },
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is FinishQuestionState) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          "finished !",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        ButtonTheme(
                          height: 50,
                          minWidth: 120,
                          child: RaisedButton(
                            onPressed: Navigator.of(context).pop,
                            color: Colors.green,
                            child: Text(
                              "Top",
                            ),
                            shape: const StadiumBorder(),
                          ),
                        )
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

class StartImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Container(
          child: Image.asset('images/image_interviewer.png'),
        ),
      ),
    );
  }
}
