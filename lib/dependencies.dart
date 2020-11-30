import 'package:get_it/get_it.dart';
import 'package:job_interview_practice/feature/setting/data/datasources/settings_data_source.dart';
import 'package:job_interview_practice/feature/setting/data/repositories/settings_repository_impl.dart';
import 'package:job_interview_practice/feature/setting/domain/repositories/settings_repository.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_number_of_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/domain/usecases/get_only_weak_question_use_case.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_dropdown_bloc.dart';
import 'package:job_interview_practice/feature/setting/presentation/bloc/settings_switch_bloc.dart';

import 'core/local_storage/local_storage.dart';
import 'feature/setting/domain/usecases/set_number_of_question_use_case.dart';
import 'feature/setting/domain/usecases/set_only_weak_question_use_case.dart';

GetIt serviceLocator = GetIt.instance;

void setupDependencies() {
  _setupCommonDependencies();
  _setupSettingsDependencies();
}

void _setupCommonDependencies() {
  serviceLocator.registerSingleton<LocalStorage>(LocalStorage());
}

void _setupSettingsDependencies() {
  // data source
  serviceLocator.registerSingleton<SettingsDataSource>(
      SettingsDataSourceImpl(localStorage: serviceLocator()));

  // repositories
  serviceLocator.registerFactory<SettingsRepository>(
      () => SettingRepositoryImpl(dataSource: serviceLocator()));

  //usecases
  serviceLocator.registerFactory<GetNumberOfQuestionUseCase>(
      () => GetNumberOfQuestionUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<GetOnlyWeakQuestionUseCase>(
      () => GetOnlyWeakQuestionUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<SetNumberOfQuestionUseCase>(
      () => SetNumberOfQuestionUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<SetOnlyWeakQuestionUseCase>(
      () => SetOnlyWeakQuestionUseCase(repository: serviceLocator()));

  // blocs
  serviceLocator.registerFactory<SettingsDropdownBloc>(() =>
      SettingsDropdownBloc(
          getNumberOfQuestionUseCase: serviceLocator(),
          setNumberOfQuestionUseCase: serviceLocator()));
  serviceLocator.registerFactory<SettingsSwitchBloc>(() => SettingsSwitchBloc(
      getOnlyWeakQuestionUseCase: serviceLocator(),
      setOnlyWeakQuestionUseCase: serviceLocator()));
}
