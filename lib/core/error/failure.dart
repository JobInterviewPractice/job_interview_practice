import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() {
    return message;
  }
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure() : super('Local Storage is unavailable');
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure() : super('Unauthorized');
}

class FirebaseWrappedError extends Failure {
  FirebaseWrappedError(String message) : super(message);
}