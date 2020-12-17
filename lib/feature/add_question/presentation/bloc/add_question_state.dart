part of 'add_question_cubit.dart';

@immutable
abstract class AddQuestionState {}

class AddQuestionInitial extends AddQuestionState {}
class AddQuestionLoading extends AddQuestionState {}
class AddQuestionSuccess extends AddQuestionState {}
