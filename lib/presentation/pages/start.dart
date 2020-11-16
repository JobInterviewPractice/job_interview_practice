import 'package:flutter/material.dart';
import 'package:job_interview_practice/presentation/widgets/appBar.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  QuizBrain quizBrain = QuizBrain();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                      "${quizBrain.answeredQuestion}/${quizBrain.numberOfQuestions}"
                  ),
                  Text(
                    "${quizBrain.getQuestionText()}",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(
              child: Image.asset('images/image_interviewer.png'),
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
                  SizedBox(width: 50),
                  RaisedButton(
                    color: Colors.green,
                    // onPressed: () => Navigator.of(context).pop(),
                    onPressed: () => {
                      setState((){
                        quizBrain.nextQuestion();

                        if(quizBrain.isFinished()){
                          Navigator.of(context).pop();
                        }
                      }),
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}