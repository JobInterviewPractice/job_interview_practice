import 'package:job_interview_practice/feature/question/data/models/question.dart';

abstract class QuestionRepository {
  Future<List<QuestionModel>> selectAll();
  Future<QuestionModel> selectByID(String id);
  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion);
}
