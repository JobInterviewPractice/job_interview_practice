import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel(this.id, this.questionText, this.isWeak);

  String id;
  String questionText;
  bool isWeak;

  // todo additional field to connect outside world ??

}
