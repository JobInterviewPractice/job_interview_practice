import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_interview_practice/feature/question/data/models/question_model.dart';

abstract class QuestionsDataSource {
  Future<List<QuestionModel>> getRandomQuestions(int limit);
  Future<void> rateQuestion(String questionId, int rate);
}

class QuestionsDataSourceImpl extends QuestionsDataSource {
  final FirebaseFirestore _store;

  QuestionsDataSourceImpl(this._store);

  @override
  Future<List<QuestionModel>> getRandomQuestions(int limit) async {
    final result = await _store.collection('questions').get();
    final random = Random();
    return List.generate(limit, (index) {
      final query = result.docs[random.nextInt(result.docs.length)];
      return QuestionModel.fromMap(query.data(), query.id);
    });
  }

  @override
  Future<void> rateQuestion(String questionId, int rate) async {
    final result = _store.collection('questions').doc(questionId);
    await _store.runTransaction((transaction) {
      return transaction.get(result).then((value) {
        final array = value.get('rate');
        array.add(rate);
        transaction.update(result, {'rate': array});
      });
    });
    return;
  }
}
