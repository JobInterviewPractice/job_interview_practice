import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({String id, String questionText, double rate, String userId, String createdAt})
      : super(id: id, questionText: questionText, rate: rate, userId: userId, createdAt: createdAt);

  factory QuestionModel.fromMap(Map<String, dynamic> map, String questionId) {
    final rates = map['rate'] == null ? [] : map['rate'].map<int>((e) => int.parse(e.toString())).toList();
    final dateTime = DateTime.fromMillisecondsSinceEpoch((map['createdAt'] as Timestamp).seconds * 1000);
    final formatter = DateFormat('yyyy-MM-dd');
    return QuestionModel(
        id: questionId,
        createdAt: formatter.format(dateTime),
        userId: map['userid'] as String,
        questionText: map['questionText'] as String,
        rate: rates.isEmpty ? 0.0 : map['rate'].reduce((a, b) => a + b)/map['rate'].length);
  }
}
