part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
  @override
  String toString() => message;
}

class LoginSuccess extends LoginState {
  final UserEntity userEntity;
  LoginSuccess(this.userEntity);
}
