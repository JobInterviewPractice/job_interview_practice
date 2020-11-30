import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/only_week_question_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';

class GetOnlyWeekQuestionUseCase extends UseCase<NoInput, OnlyWeekQuestionEntity> {
  final SettingsRepository repository;

  GetOnlyWeekQuestionUseCase({this.repository});

  @override
  Future<Either<Failure, OnlyWeekQuestionEntity>> call(NoInput input) {
    return repository.getOnlyWeekQuestion();
  }
}