part of 'question_bloc.dart';

abstract class QuestionEvents {}

class QuestionEvent extends QuestionEvents {}

class QuestionAddPageLoadedEvent extends QuestionEvents {}

class QuestionAddEvent extends QuestionEvent {
  final String questionText;
  QuestionAddEvent({this.questionText});
}
