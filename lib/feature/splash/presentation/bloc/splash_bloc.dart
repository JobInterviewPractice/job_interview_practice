import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/splash/domain/usecases/splash_usecase.dart';
import 'package:job_interview_practice/feature/splash/presentation/bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUseCase useCase;

  SplashBloc({this.useCase}) : super(SplashInitial()) {
    add(SplashEvent());
  }

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    final result = await useCase(NoInput());
    yield SplashCheckerState(result.getOrElse(() => false));
  }
}
