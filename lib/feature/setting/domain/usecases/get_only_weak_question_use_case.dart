import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/only_weak_question_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';

class GetOnlyWeakQuestionUseCase
    extends UseCase<NoInput, OnlyWeakQuestionEntity> {
  final SettingsRepository repository;

  GetOnlyWeakQuestionUseCase({this.repository});

  @override
  Future<Either<Failure, OnlyWeakQuestionEntity>> call(NoInput input) {
    return repository.getOnlyWeakQuestion();
  }
}
