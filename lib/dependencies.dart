import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:job_interview_practice/core/local_storage/db_wrapper.dart';
import 'package:job_interview_practice/core/services/remote_date_store.dart';
import 'package:job_interview_practice/feature/login/data/datasources/login_remote_data_source.dart';
import 'package:job_interview_practice/feature/login/data/repositories/login_repository_impl.dart';
import 'package:job_interview_practice/feature/login/domain/repositories/login_repository.dart';
import 'package:job_interview_practice/feature/login/domain/usecases/login_usecase.dart';
import 'package:job_interview_practice/feature/login/domain/usecases/register_usecase.dart';
import 'package:job_interview_practice/feature/login/presentation/bloc/login_bloc.dart';
import 'package:job_interview_practice/feature/question/data/datasources/questions_data_source.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository_impl.dart';
import 'package:job_interview_practice/feature/question/domain/usecases/get_all_questions_use_case.dart';
import 'package:job_interview_practice/feature/question/presentation/bloc/question_bloc.dart';
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
import 'package:job_interview_practice/feature/splash/data/datasources/splash_remote_data_source.dart';
import 'package:job_interview_practice/feature/splash/data/repositories/splash_repository_impl.dart';
import 'package:job_interview_practice/feature/splash/domain/repositories/splash_repository.dart';
import 'package:job_interview_practice/feature/splash/domain/usecases/splash_usecase.dart';
import 'package:job_interview_practice/feature/splash/presentation/bloc/bloc.dart';
import 'package:job_interview_practice/feature/start/domain/usecases/rate_question_use_case.dart';
import 'package:job_interview_practice/feature/start/domain/usecases/select_random_question_use_case.dart';
import 'package:job_interview_practice/feature/start/presentation/bloc/start_next_bloc.dart';

import 'core/local_storage/local_storage.dart';
import 'feature/setting/domain/usecases/set_number_of_question_use_case.dart';
import 'feature/setting/domain/usecases/set_only_weak_question_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

GetIt serviceLocator = GetIt.instance;

void setupDependencies() {
  _setupCommonDependencies();
  _setupSettingsDependencies();
  _setupStartDependencies();
  _setupRecordingsDependencies();
  _setupSplashDependencies();
  _setupLoginDependencies();
  _setupQuestionAdddDependencies();
}

void _setupCommonDependencies() {
  serviceLocator.registerSingleton<LocalStorage>(LocalStorage());
  serviceLocator.registerSingleton<DBWrapper>(DBWrapper());
  serviceLocator.registerLazySingleton(() => auth.FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => RemoteDateStore());
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);
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
}

void _setupStartDependencies() {
  // data source
  serviceLocator.registerSingleton<QuestionsDataSource>(QuestionsDataSourceImpl(serviceLocator()));
  //repositories
  serviceLocator.registerFactory<QuestionRepository>(() => QuestionRepositoryImpl(dataSource: serviceLocator()));
  //usecases
  serviceLocator
      .registerFactory<SelectRandomQuestionUseCase>(() => SelectRandomQuestionUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<RateQuestionUseCase>(() => RateQuestionUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<GetAllQuestionsUseCase>(() => GetAllQuestionsUseCase(repository: serviceLocator()));

  //blocs
  serviceLocator
      .registerFactory<QuestionBloc>(() => QuestionBloc(useCase: serviceLocator()));
  serviceLocator.registerFactory<StartNextBloc>(() => StartNextBloc(
      getNumberOfQuestionUseCase: serviceLocator(),
      selectRandomQuestionUseCase: serviceLocator(),
      rateQuestionUseCase: serviceLocator()));
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

void _setupSplashDependencies() {
  // data source
  serviceLocator.registerSingleton<SplashRemoteDataSource>(SplashRemoteDataSourceImpl(serviceLocator()));

  // repositories
  serviceLocator.registerFactory<SplashRepository>(() => SplashRepositoryImpl(dataSource: serviceLocator()));

  //usecases
  serviceLocator.registerFactory<SplashUseCase>(() => SplashUseCase(repository: serviceLocator()));

  // blocs
  serviceLocator.registerFactory<SplashBloc>(() => SplashBloc(useCase: serviceLocator()));
}

void _setupLoginDependencies() {
  // data source
  serviceLocator
      .registerSingleton<LoginRemoteDataSource>(LoginRemoteDataSourceImpl(serviceLocator(), serviceLocator()));

  // repositories
  serviceLocator.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(dataSource: serviceLocator(), remoteDateStore: serviceLocator()));

  //usecases
  serviceLocator.registerFactory<LoginUseCase>(() => LoginUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<RegisterUseCase>(() => RegisterUseCase(repository: serviceLocator()));

  // blocs
  serviceLocator
      .registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: serviceLocator(), registerUseCase: serviceLocator()));
}

void _setupQuestionAdddDependencies() {
  serviceLocator.registerFactory<QuestionAddBloc>(() => QuestionAddBloc(useCase: serviceLocator()));
}