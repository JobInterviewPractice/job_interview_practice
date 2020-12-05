import 'package:job_interview_practice/feature/question/data/models/question.dart';

abstract class EditState {}

class LoadingEditState extends EditState {}

class LoadedEditState extends EditState {
  final List<QuestionModel> allQuestions;
  LoadedEditState({this.allQuestions});
}
