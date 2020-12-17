import 'package:job_interview_practice/core/logic/usecase.dart';

abstract class AddQuestionRepository {
  Future<NoOutput> addQuestion(String questionText);
}
