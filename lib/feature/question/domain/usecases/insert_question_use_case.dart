import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class InsertQuestionUseCase extends UseCaseRight<String, void> {
  final QuestionRepository repository;

  InsertQuestionUseCase({this.repository});

  // todo: ここの実装を見直し
  // firestoreにdataをinsert
  @override
  Future<void> call(String input) {
    return repository.insert(input);
  }
}
