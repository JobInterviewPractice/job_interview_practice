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