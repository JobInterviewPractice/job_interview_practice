import 'package:job_interview_practice/data/models/question.dart';
import 'package:job_interview_practice/data/repositories/question_repository_impl.dart';

class QuestionService {

  QuestionService(this.numberOfQuestions);

  int           numberOfQuestions; // todo: numberofquestionをsettings pageから引っ張ってくる。
  int           answeredQuestion;
  QuestionModel nowQuestion;

  int    getAnsweredQuestion() {return this.answeredQuestion;}
  String getQuestionText() {return nowQuestion.questionText;}

  void   nextQuestion() {
    QuestionRepositoryImpl qr = QuestionRepositoryImpl();
    nowQuestion = qr.selectByID("");
    this.answeredQuestion++;
  }
}