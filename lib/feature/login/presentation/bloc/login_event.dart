part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  SignInEvent({this.email, this.password});
}

class SignUpEvent extends LoginEvent {
  final String email;
  final String password;
  final String filePath;

  SignUpEvent({this.email, this.password, this.filePath});
}


