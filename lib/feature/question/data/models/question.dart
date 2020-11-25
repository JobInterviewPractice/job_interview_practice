import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel(this.id, this.questionText, this.isWeek);

  String id;
  String questionText;
  bool isWeek;

  // todo additional field to connect outside world ??

}
