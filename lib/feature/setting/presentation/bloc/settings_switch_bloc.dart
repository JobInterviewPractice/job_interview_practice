import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/only_week_question_entity.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_only_week_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/set_only_week_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_event.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_state.dart';

class SettingsSwitchBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetOnlyWeekQuestionUseCase _getOnlyWeekQuestionUseCase;
  final SetOnlyWeekQuestionUseCase _setOnlyWeekQuestionUseCase;

  SettingsSwitchBloc(
      {GetOnlyWeekQuestionUseCase getOnlyWeekQuestionUseCase, SetOnlyWeekQuestionUseCase setOnlyWeekQuestionUseCase})
      : _setOnlyWeekQuestionUseCase = setOnlyWeekQuestionUseCase,
        _getOnlyWeekQuestionUseCase = getOnlyWeekQuestionUseCase,
        super(LoadingSettingsState()) {
    add(SetupSettingsEvent());
  }

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is SetupSettingsEvent) {
      final numberOfQuestions = await _getOnlyWeekQuestionUseCase(NoInput());
      yield* _eitherLoaded(numberOfQuestions);
    } else if (event is ChangeOnlyWeekSwitch) {
      await _setOnlyWeekQuestionUseCase(event.value);
      yield LoadedSettingsStateSwitch(onlyWeak: event.value);
    }
  }

  Stream<SettingsState> _eitherLoaded(Either<Failure, OnlyWeekQuestionEntity> either) async* {
    yield either.fold(
        (_) => LoadedSettingsStateSwitch(onlyWeak: false), (r) => LoadedSettingsStateSwitch(onlyWeak: r.onlyWeek));
  }
}
