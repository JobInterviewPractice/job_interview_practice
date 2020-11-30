import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';

class SetNumberOfQuestionUseCase extends UseCase<int, NoOutput> {
  final SettingsRepository repository;

  SetNumberOfQuestionUseCase({this.repository});

  @override
  Future<Either<Failure, NoOutput>> call(int input) {
    return repository.setNumberOfQuestions(input);
  }
}