import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_interview_practice/feature/login/domain/entities/login_entity.dart';
import 'package:job_interview_practice/feature/login/domain/entities/user_entity.dart';
import 'package:job_interview_practice/feature/login/domain/usecases/login_usecase.dart';
import 'package:job_interview_practice/feature/login/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  LoginBloc({this.loginUseCase, this.registerUseCase}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SignInEvent) {
      yield LoginLoading();
      final result = await loginUseCase(LoginEntity(event.email, event.password, null));
      yield* result.fold((l) async* {
        yield LoginError(l.message);
      }, (r) async* {
        yield LoginSuccess(r);
      });
    } else if (event is SignUpEvent) {
      yield LoginLoading();
      final result = await registerUseCase(LoginEntity(event.email, event.password, event.filePath));
      yield* result.fold((l) async* {
        yield LoginError(l.message);
      }, (r) async* {
        yield LoginSuccess(r);
      });
    }
  }
}
