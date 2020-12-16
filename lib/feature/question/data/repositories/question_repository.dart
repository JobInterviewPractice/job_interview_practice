import 'package:job_interview_practice/feature/question/data/models/question_model.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';

abstract class QuestionRepository {
  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion);
  Future<List<QuestionUserModel>> getAll();
  Future<void> rateQuestion(String questionId, int rate);

  Future<void> insert(String questionText);
}
