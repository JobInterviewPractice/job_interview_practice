import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';
import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

class SelectRandomQuestionUseCase extends UseCaseRight<int, List<QuestionEntity>> {
  final QuestionRepository repository;

  SelectRandomQuestionUseCase({this.repository});

  @override
  Future<List<QuestionEntity>> call(int input) {
    return repository.selectByRandom(input);
  }
}
