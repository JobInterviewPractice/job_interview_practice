import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';

class SetOnlyWeekQuestionUseCase extends UseCase<bool, NoOutput> {
  final SettingsRepository repository;

  SetOnlyWeekQuestionUseCase({this.repository});

  @override
  Future<Either<Failure, NoOutput>> call(bool input) {
    return repository.setOnlyWeekQuestion(input);
  }
}