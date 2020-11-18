import 'package:job_interview_practice/data/models/question.dart';

abstract class QuestionRepository {
  QuestionModel selectByID(String id);
  List<QuestionModel> selectAll();
}