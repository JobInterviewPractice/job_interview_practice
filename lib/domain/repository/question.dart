import 'package:job_interview_practice/data/models/question.dart';
import 'package:job_interview_practice/domain/entities/question.dart';

abstract class QuestionRepository extends Question{
  QuestionRepository() : super.zero();

  QuestionModel selectByID(String id);
  List<QuestionModel> selectAll();

}