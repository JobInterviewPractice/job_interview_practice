import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/feature/question/data/models/question.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';

class StartNextBloc extends Bloc<StartEvent, StartState> {
  StartNextBloc() : super(LoadingStartState()) {
    add(SetupStartEvent());
  }

  int _questionCount = 0;
  int _numberOfTotalQuestions =
      10; // todo: get from local setting [number of quesitons]

  @override
  Stream<StartState> mapEventToState(StartEvent event) async* {
    if (event is SetupStartEvent) {
      yield LoadingStartState();
    } else if (event is NextStartEvent) {
      // todo:fetch next question
      QuestionModel nextQuestion = QuestionModel("test", "test", false);

      _questionCount++;
      if (_questionCount == _numberOfTotalQuestions) {
        yield FinishQuestionState();
      } else {
        yield LoadedStartState(
            nowQuestion: nextQuestion.questionText,
            numberOfAnsweringQuestions: _questionCount,
            numberOfTotalQuestions: _numberOfTotalQuestions);
      }
    }
  }
}
