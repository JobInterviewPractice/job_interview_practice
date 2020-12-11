import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class GetAllQuestionsUseCase extends UseCaseRight<NoInput, List<QuestionUserModel>> {
  final QuestionRepository repository;

  GetAllQuestionsUseCase({this.repository});

  @override
  Future<List<QuestionUserModel>> call(NoInput input) {
    return repository.getAll();
  }
}