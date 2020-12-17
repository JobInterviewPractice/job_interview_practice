import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/add_question/domain/repositories/add_question_repository.dart';

class AddQuestionUseCase implements UseCaseRight<String, NoOutput> {
  final AddQuestionRepository repository;

  AddQuestionUseCase(this.repository);

  @override
  Future<NoOutput> call(String input) {
    return repository.addQuestion(input);
  }
}
