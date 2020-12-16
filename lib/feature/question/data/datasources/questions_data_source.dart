import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_interview_practice/feature/login/data/model/user_model.dart';
import 'package:job_interview_practice/feature/question/data/models/question_model.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';

abstract class QuestionsDataSource {
  Future<List<QuestionModel>> getRandomQuestions(int limit);
  Future<List<QuestionUserModel>> getAllQuestions();
  Future<void> rateQuestion(String questionId, int rate);
  Future<void> insertQuestion(String questionText);
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
  Future<List<QuestionUserModel>> getAllQuestions() async {
    final queryQuestions = await _store.collection('questions').get();
    final questions = queryQuestions.docs
        .map((e) => QuestionModel.fromMap(e.data(), e.id))
        .toList();
    final queryUsers = await _store
        .collection('users')
        .where('userId', whereIn: questions.map((e) => e.userId).toList())
        .get();
    final users =
        queryUsers.docs.map((e) => UserModel.fromMap(e.data())).toList();
    return questions
        .map((e) => QuestionUserModel(
            questionModel: e,
            userModel:
                users.firstWhere((element) => element.userId == e.userId)))
        .toList();
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

  @override
  Future<void> insertQuestion(String questionText) {
    _store.collection('questions').add({
      questionText: questionText,
    });
  }
}
