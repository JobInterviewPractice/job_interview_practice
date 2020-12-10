import 'package:job_interview_practice/feature/question/domain/entities/question.dart';

abstract class StartState {}

class LoadingStartState extends StartState {}

class LoadedStartState extends StartState {
  final QuestionEntity question;
  final int numberOfAnswering;
  final int totalNumber;

  LoadedStartState({this.question, this.numberOfAnswering, this.totalNumber});
}

class FinishQuestionState extends StartState {
  final List<QuestionEntity> questions;
  FinishQuestionState(this.questions);
}
