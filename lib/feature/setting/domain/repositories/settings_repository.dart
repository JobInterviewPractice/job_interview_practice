import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/number_of_questions_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/only_weak_question_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, NumberOfQuestionsEntity>> getNumberOfQuestions();
  Future<Either<Failure, OnlyWeakQuestionEntity>> getOnlyWeakQuestion();
  Future<Either<Failure, NoOutput>> setNumberOfQuestions(int input);
  Future<Either<Failure, NoOutput>> setOnlyWeakQuestion(bool input);
}
