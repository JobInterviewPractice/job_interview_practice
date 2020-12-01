import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/question/data/models/question.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository_impl.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_number_of_question_use_case.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_event.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_state.dart';

class StartNextBloc extends Bloc<StartEvent, StartState> {
  StartNextBloc(
      {GetNumberOfQuestionUseCase getNumberOfQuestionUseCase,
      QuestionRepositoryImpl questionRepositoryImpl})
      : _getNumberOfQuestionUseCase = getNumberOfQuestionUseCase,
        _questionRepositoryImpl = questionRepositoryImpl,
        super(LoadingStartState()) {
    add(NextStartEvent());
    fetchNumberOfTotalQuestions();
  }

  void fetchNumberOfTotalQuestions() async {
    final numberOfTotalQuestionEither =
        await _getNumberOfQuestionUseCase(NoInput());
    this._numberOfTotalQuestions =
        numberOfTotalQuestionEither.fold((l) => 10, (r) => r.number);
  }

  void fetchQuestions(int n) async {
    this.questions = await _questionRepositoryImpl.selectByRandom(n);
  }

  final GetNumberOfQuestionUseCase _getNumberOfQuestionUseCase;
  final QuestionRepositoryImpl _questionRepositoryImpl;
  int _questionCount = 0;
  int _numberOfTotalQuestions;
  List<QuestionModel> questions;
  QuestionModel nowQuestion;

  @override
  Stream<StartState> mapEventToState(StartEvent event) async* {
    if (event is SetupStartEvent) {
      yield LoadingStartState();
    } else if (event is NextStartEvent) {
      _questionCount++;

      this.nowQuestion = questions[_questionCount];

      if (_questionCount == _numberOfTotalQuestions) {
        yield FinishQuestionState();
      } else {
        yield LoadedStartState(
            nowQuestion: nowQuestion.questionText,
            numberOfAnsweringQuestions: _questionCount,
            numberOfTotalQuestions: _numberOfTotalQuestions);
      }
    }
  }
}
