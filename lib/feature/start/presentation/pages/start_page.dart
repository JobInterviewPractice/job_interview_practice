import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/camera_widget.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_next_bloc.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';
import 'package:job_interview_practice/feature/start/presentation/widgets/start_image.dart';

class _Rate {
  int value = 0;
}

class StartPage extends StatelessWidget {
  final _Rate rate = _Rate();

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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StartImage(),
                              Expanded(
                                child: Container(
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54, width: 3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 4,
                              ),
                              Text("Rate question (optional)"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Easy"),
                                  BlocBuilder<StartNextBloc, StartState>(
                                    builder: (_, __) => Container(
                                      key: UniqueKey(),
                                      child: RatingBar.builder(
                                        itemSize: 32,
                                        glowColor: Colors.red,
                                        maxRating: 5,
                                        initialRating: 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        onRatingUpdate: (rating) {
                                          rate.value = rating.toInt();
                                        },
                                      ),
                                    ),
                                  ),
                                  Text("Hard"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                              child: CameraWidget(),
                            ),
                          ),
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
                                      onPressed: () {
                                        BlocProvider.of<StartNextBloc>(context)
                                            .add(NextQuestionEvent(rate.value > 0 ? rate.value : null));
                                        rate.value = -1;
                                      },
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
