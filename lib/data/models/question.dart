import '../../domain/entities/question.dart';

class QuestionModel extends Question {

  String id;
  String questionText;
  bool isWeek;

  QuestionModel(String id, String questionText, bool isWeek) : super(id, questionText, isWeek);
  QuestionModel.zero() : super.zero();
}

