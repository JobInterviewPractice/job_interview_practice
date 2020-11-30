import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/number_of_questions_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';

class GetNumberOfQuestionUseCase extends UseCase<NoInput, NumberOfQuestionsEntity> {
  final SettingsRepository repository;

  GetNumberOfQuestionUseCase({this.repository});

  @override
  Future<Either<Failure, NumberOfQuestionsEntity>> call(NoInput input) {
    return repository.getNumberOfQuestions();
  }
}