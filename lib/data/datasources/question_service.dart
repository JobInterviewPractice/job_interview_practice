import 'package:job_interview_practice/data/models/question.dart';
import 'package:job_interview_practice/question.dart';



// todo: getQuestion model

class QuestionService extends QuestionModel{
  int numberOfQuestions = 5; // todo: numberofquestionをsettings pageから引っ張ってくる。
  int _questionID = 0;
  int answeredQuestion = 0;

  List<QuestionModel> questions = [
    // todo: bring from Data Store
    QuestionModel('','Some cats are actually allergic to humans',false),
    QuestionModel('','You can lead a cow down stairs but not up stairs.',false),
    QuestionModel('','test',false),
    QuestionModel('','You can lead a cow down',false),
  ];

  QuestionService.zero() : super.zero();
}
