import 'package:job_interview_practice/data/models/question.dart';

class QuestionService extends QuestionModel{

  QuestionService.init(this.numberOfQuestions,this.answeredQuestion) : super();

  int           numberOfQuestions; // todo: numberofquestionをsettings pageから引っ張ってくる。
  int           answeredQuestion;
  QuestionModel nowQuestion;

  int    getAnsweredQuestion() {return this.answeredQuestion;}
  String getQuestionText() {return nowQuestion.questionText;}
  void   nextQuestion() {
    nowQuestion = selectByID("");
    this.answeredQuestion++;
  }
}