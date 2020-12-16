import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class InsertQuestionUseCase extends UseCaseRight<QuestionUserModel, NoOutput> {
  final QuestionRepository repository;

  InsertQuestionUseCase({this.repository});

  // todo: ここの実装を見直し
  @override
  Future<NoOutput> call(QuestionUserModel input) async {
    return await NoOutput();
  }
}
