import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

abstract class StartState {}

class LoadingStartState extends StartState {}

class LoadedStartState extends StartState {
  final Question question;
  final int numberOfAnswering;
  final int totalNumber;

  LoadedStartState({this.question, this.numberOfAnswering, this.totalNumber});
}

class FinishQuestionState extends StartState {
  final List<Question> questions;
  FinishQuestionState(this.questions);
}
