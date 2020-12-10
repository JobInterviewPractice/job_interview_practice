import 'package:job_interview_practice/feature/question/data/models/question_model.dart';

abstract class QuestionRepository {
  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion);
  Future<void> rateQuestion(String questionId, int rate);
}
