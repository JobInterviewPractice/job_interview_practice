import 'package:job_interview_practice/data/models/question.dart';

abstract class QuestionRepository {
  Future<QuestionModel> selectByID(String id);
  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion);
}
