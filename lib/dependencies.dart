import 'package:get_it/get_it.dart';
import 'package:job_interview_practice/core/local_storage/db_wrapper.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository_impl.dart';
import 'package:job_interview_practice/feature/recordings/data/datasources/recordings_local_data_source.dart';
import 'package:job_interview_practice/feature/recordings/data/repositories/recordings_repository_impl.dart';
import 'package:job_interview_practice/feature/recordings/domain/repositories/recordings_repository.dart';
import 'package:job_interview_practice/feature/recordings/domain/usecases/get_recordings_usecase.dart';
import 'package:job_interview_practice/feature/recordings/presentation/bloc/recordings_bloc.dart';
import 'package:job_interview_practice/feature/setting/data/datasources/settings_data_source.dart';
import 'package:job_interview_practice/feature/setting/data/repositories/settings_repository_impl.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_number_of_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_only_weak_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_dropdown_bloc.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_switch_bloc.dart';
import 'package:job_interview_practice/feature/start/domain/usecases/select_random_question_use_case.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_next_bloc.dart';
import 'feature/edit/presentation/bloc/edit_bloc.dart';
import 'feature/edit/presentation/bloc/edit_state.dart';
import 'core/local_storage/local_storage.dart';
import 'feature/setting/domain/usecases/set_number_of_question_use_case.dart';
import 'feature/setting/domain/usecases/set_only_weak_question_use_case.dart';

GetIt serviceLocator = GetIt.instance;

void setupDependencies() {
  _setupCommonDependencies();
  _setupSettingsDependencies();
  _setupStartDependencies();
  _setupRecordingsDependencies();
}

void _setupCommonDependencies() {
  serviceLocator.registerSingleton<LocalStorage>(LocalStorage());
  serviceLocator.registerSingleton<DBWrapper>(DBWrapper());
}

void _setupSettingsDependencies() {
  // data source
  serviceLocator.registerSingleton<SettingsDataSource>(SettingsDataSourceImpl(localStorage: serviceLocator()));

  // repositories
  serviceLocator.registerFactory<SettingsRepository>(() => SettingRepositoryImpl(dataSource: serviceLocator()));

  //usecases
  serviceLocator
      .registerFactory<GetNumberOfQuestionUseCase>(() => GetNumberOfQuestionUseCase(repository: serviceLocator()));
  serviceLocator
      .registerFactory<GetOnlyWeakQuestionUseCase>(() => GetOnlyWeakQuestionUseCase(repository: serviceLocator()));
  serviceLocator
      .registerFactory<SetNumberOfQuestionUseCase>(() => SetNumberOfQuestionUseCase(repository: serviceLocator()));
  serviceLocator
      .registerFactory<SetOnlyWeakQuestionUseCase>(() => SetOnlyWeakQuestionUseCase(repository: serviceLocator()));

  // blocs
  serviceLocator.registerFactory<SettingsDropdownBloc>(() =>
      SettingsDropdownBloc(getNumberOfQuestionUseCase: serviceLocator(), setNumberOfQuestionUseCase: serviceLocator()));
  serviceLocator.registerFactory<SettingsSwitchBloc>(() =>
      SettingsSwitchBloc(getOnlyWeakQuestionUseCase: serviceLocator(), setOnlyWeakQuestionUseCase: serviceLocator()));
  serviceLocator.registerFactory<EditBloc>(() => EditBloc());
}

void _setupStartDependencies() {
  //repositories
  serviceLocator.registerFactory<QuestionRepository>(() => QuestionRepositoryImpl());
  //usecases
  serviceLocator
      .registerFactory<SelectRandomQuestionUseCase>(() => SelectRandomQuestionUseCase(repository: serviceLocator()));

  //blocs
  serviceLocator.registerFactory<StartNextBloc>(
      () => StartNextBloc(getNumberOfQuestionUseCase: serviceLocator(), selectRandomQuestionUseCase: serviceLocator()));
}

void _setupRecordingsDependencies() {
  // data source
  serviceLocator.registerSingleton<RecordingsLocalDataSource>(RecordingsLocalDataSourceImpl(serviceLocator()));

  // repositories
  serviceLocator.registerFactory<RecordingsRepository>(() => RecordingsRepositoryImpl(dataSource: serviceLocator()));

  //usecases
  serviceLocator.registerFactory<GetRecordingsUseCase>(() => GetRecordingsUseCase(repository: serviceLocator()));

  // blocs
  serviceLocator.registerFactory<RecordingsBloc>(() => RecordingsBloc(getRecordingsUseCase: serviceLocator()));
}
