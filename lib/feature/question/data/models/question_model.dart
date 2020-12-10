import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({String id, String questionText, double rate}) : super(id: id, questionText: questionText, rate: rate);

  factory QuestionModel.fromMap(Map<String, dynamic> map, String questionId) {
    final rates = map['rate'].isEmpty ? [] : map['rate'].map<int>((e) => int.parse(e.toString())).toList();
    return QuestionModel(
        id: questionId,
        questionText: map['questionText'] as String,
        rate: rates.isEmpty ? 0.0 : map['rate'].reduce((a, b) => a + b)/map['rate'].length);
  }
}
