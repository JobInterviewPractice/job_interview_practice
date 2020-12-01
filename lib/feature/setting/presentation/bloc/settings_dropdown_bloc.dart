import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/number_of_questions_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_number_of_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/set_number_of_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_event.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_state.dart';

class SettingsDropdownBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetNumberOfQuestionUseCase _getNumberOfQuestionUseCase;
  final SetNumberOfQuestionUseCase _setNumberOfQuestionUseCase;

  SettingsDropdownBloc(
      {GetNumberOfQuestionUseCase getNumberOfQuestionUseCase,
      SetNumberOfQuestionUseCase setNumberOfQuestionUseCase})
      : _getNumberOfQuestionUseCase = getNumberOfQuestionUseCase,
        _setNumberOfQuestionUseCase = setNumberOfQuestionUseCase,
        super(LoadingSettingsState()) {
    add(SetupSettingsEvent());
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SetupSettingsEvent) {
      final numberOfQuestions = await _getNumberOfQuestionUseCase(NoInput());
      yield* _eitherLoaded(numberOfQuestions);
    } else if (event is ChangeNumberOfQuestion) {
      await _setNumberOfQuestionUseCase(event.value);
      yield LoadedSettingsStateDropdown(dropdownValue: event.value);
    }
  }

  Stream<SettingsState> _eitherLoaded(
      Either<Failure, NumberOfQuestionsEntity> either) async* {
    yield either.fold((_) => LoadedSettingsStateDropdown(dropdownValue: 1),
        (r) => LoadedSettingsStateDropdown(dropdownValue: r.number));
  }
}
