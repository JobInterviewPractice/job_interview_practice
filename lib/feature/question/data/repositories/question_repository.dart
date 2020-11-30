import 'package:job_interview_practice/feature/question/data/models/question.dart';

abstract class QuestionRepository {
  Future<QuestionModel> selectByID(String id);
  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion);
}
