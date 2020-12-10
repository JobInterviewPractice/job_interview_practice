import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/feature/question/data/datasources/questions_data_source.dart';
import 'package:job_interview_practice/feature/question/data/models/question_model.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionsDataSource dataSource;

  QuestionRepositoryImpl({this.dataSource});

  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion) async {
    final result = await dataSource.getRandomQuestions(numberOfQuestion);
    return result;
  }

  @override
  Future<void> rateQuestion(String questionId, int rate) {
    return dataSource.rateQuestion(questionId, rate);
  }
}
