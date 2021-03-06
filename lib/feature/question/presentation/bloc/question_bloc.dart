import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/models/questions_user_model.dart';
import 'package:job_interview_practice/feature/question/domain/usecases/get_all_questions_use_case.dart';
import 'package:meta/meta.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetAllQuestionsUseCase useCase;
  QuestionBloc({this.useCase}) : super(QuestionInitial());

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    final result = await useCase(NoInput());
    yield QuestionsLoaded(result);
  }
}
