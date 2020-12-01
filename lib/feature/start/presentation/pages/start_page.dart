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
              height: 100,
            ),
            BlocBuilder<StartNextBloc, StartState>(
              builder: (context, state) {
                if (state is LoadedStartState) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                              "${state.numberOfAnswering}/${state.totalNumber}"),
                          Text(
                            state.question.questionText,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is FinishQuestionState) {
                  return Column(
                    children: [
                      Text(
                        "finished !",
                        style: TextStyle(fontSize: 30),
                      ),
                      RaisedButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text("Top"),
                      )
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Spacer(),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Container(
                  child: Image.asset('images/image_interviewer.png'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.amber,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Exit'),
                    ),
                    BlocBuilder<StartNextBloc, StartState>(
                      builder: (context, state) {
                        return RaisedButton(
                          color: Colors.green,
                          onPressed: () => {
                            BlocProvider.of<StartNextBloc>(context)
                                .add(NextQuestionEvent())
                          },
                          child: Text('Next'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
