import 'package:job_interview_practice/data/models/question.dart';
import 'package:job_interview_practice/data/repositories/question_repository_impl.dart';

class QuestionService {
  QuestionService(this.numberOfQuestions, this.nowQuestion) {
    setQuestions();
  }

  int numberOfQuestions; // todo: numberofquestionをsettings pageから引っ張ってくる。
  int answeredQuestion = 0;
  QuestionModel nowQuestion;
  List<QuestionModel> questions = [];

  void setQuestions() async {
    QuestionRepositoryImpl qr = QuestionRepositoryImpl();
    questions = await qr.selectByRandom(numberOfQuestions);
    // initialize for first question
    nowQuestion = questions[0];
  }

  int getAnsweredQuestion() {
    return this.answeredQuestion;
  }

  String getQuestionText() {
    return nowQuestion.questionText;
  }

  void nextQuestion() async {
    QuestionRepositoryImpl qr = QuestionRepositoryImpl();
    this.answeredQuestion++;
    if (answeredQuestion == numberOfQuestions) {
      return;
    }
    nowQuestion = questions[answeredQuestion];
  }
}
