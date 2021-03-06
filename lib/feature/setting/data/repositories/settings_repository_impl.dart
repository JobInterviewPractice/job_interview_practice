import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/data/datasources/settings_data_source.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/number_of_questions_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/only_weak_question_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';

class SettingRepositoryImpl extends SettingsRepository {
  final SettingsDataSource _dataSource;

  SettingRepositoryImpl({SettingsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Either<Failure, NumberOfQuestionsEntity>>
      getNumberOfQuestions() async {
    final result = await _dataSource.getNumberOfQuestions();
    return Right(result);
  }

  @override
  Future<Either<Failure, OnlyWeakQuestionEntity>> getOnlyWeakQuestion() async {
    final result = await _dataSource.getOnlyWeakQuestion();
    return Right(result);
  }

  @override
  Future<Either<Failure, NoOutput>> setNumberOfQuestions(int input) async {
    final result = await _dataSource.setNumberOfQuestions(input);
    return Right(result);
  }

  @override
  Future<Either<Failure, NoOutput>> setOnlyWeakQuestion(bool input) async {
    final result = await _dataSource.setOnlyWeakQuestion(input);
    return Right(result);
  }
}
