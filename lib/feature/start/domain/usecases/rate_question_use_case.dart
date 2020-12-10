import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class RateQuestionUseCase extends UseCaseRight<RateParam, NoOutput> {
  final QuestionRepository repository;

  RateQuestionUseCase({this.repository});

  @override
  Future<NoOutput> call(RateParam input) async {
    await repository.rateQuestion(input.questionId, input.rate);
  }
}

class RateParam {
  final String questionId;
  final int rate;

  RateParam({this.questionId, this.rate});
}