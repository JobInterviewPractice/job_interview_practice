part of 'question_bloc.dart';

@immutable
abstract class QuestionState {}

class QuestionInitial extends QuestionState {}

class QuestionsLoaded extends QuestionState {
  final List<QuestionUserModel> questions;
  QuestionsLoaded(this.questions);
}

class QuestionAddPageLoaded extends QuestionState {}
