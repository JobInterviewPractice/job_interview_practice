import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/feature/question/domain/entities/question.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_number_of_question_use_case.dart';
import 'package:job_interview_practice/feature/start/domain/usecases/select_random_question_use_case.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';

class StartNextBloc extends Bloc<StartEvent, StartState> {
  final GetNumberOfQuestionUseCase getNumberOfQuestionUseCase;
  final SelectRandomQuestionUseCase selectRandomQuestionUseCase;
  List<Question> _questions;
  int _currentQuestion = -1;

  StartNextBloc({this.getNumberOfQuestionUseCase, this.selectRandomQuestionUseCase}) : super(LoadingStartState()) {
    _loading();
  }

  void _loading() async {
    _questions = await selectRandomQuestionUseCase(1);
    add(NextQuestionEvent());
  }

  @override
  Stream<StartState> mapEventToState(StartEvent event) async* {
    ++_currentQuestion;
    if (_currentQuestion >= _questions.length) {
      yield FinishQuestionState();
    } else {
      yield LoadedStartState(
          question: _questions[_currentQuestion],
          numberOfAnswering: _currentQuestion,
          totalNumber: _questions.length);
    }
  }
}
