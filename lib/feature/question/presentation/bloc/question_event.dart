part of 'question_bloc.dart';

abstract class QuestionEvents {}

class QuestionEvent extends QuestionEvents {}

class QuestionAddEvent extends QuestionEvent {
  final String qustionText;
  QuestionAddEvent({this.qustionText});
}
