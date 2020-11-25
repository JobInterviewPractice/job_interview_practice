import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_interview_practice/feature/question/data/datasources/question_service.dart';
import 'package:job_interview_practice/feature/question/data/models/question.dart';
import 'package:job_interview_practice/feature/question/presentation/widgets/appBar.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // Todo: remove hardcode
  QuestionService questionService =
      QuestionService(3, QuestionModel("2", "good", true));

  @override
  void initState() {
    super.initState();
  }

  @override
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
                      "${questionService.answeredQuestion}/${questionService.numberOfQuestions}"),
                  Text(
                    "${questionService.getQuestionText()}",
                    style: TextStyle(fontSize: 20),
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
                      setState(
                        () {
                          questionService.nextQuestion();
                          if (questionService.answeredQuestion ==
                              questionService.numberOfQuestions) {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
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

class BodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('questions').snapshots(),
        builder: (context, snapshot) {
          return (!snapshot.hasData)
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        QuestionCard(
                          problemInt: index + 1.toInt(),
                          questionText:
                              snapshot.data.docs[index].get('questionText'),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final int problemInt;
  final String questionText;

  const QuestionCard({
    Key key,
    @required this.problemInt,
    @required this.questionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Text("${problemInt}"),
                Text(
                  "${questionText}",
                  style: TextStyle(fontSize: 20),
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
                    // setState((){
                    //quizBrain.nextQuestion();

                    // if(quizBrain.isFinished()){
                    //Navigator.of(context).pop();
                    // }
                    // }),
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
