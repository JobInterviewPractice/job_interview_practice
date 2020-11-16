import '../../domain/entities/question.dart';

class QuestionModel extends Question {

  int id;
  String questionText;
  bool isWeek;

  QuestionModel(int id, String questionText, bool isWeek) : super(id, questionText, isWeek);
}

