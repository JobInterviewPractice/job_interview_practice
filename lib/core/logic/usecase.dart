import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:job_interview_practice/core/error/failure.dart';

abstract class UseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}

abstract class UseCaseRight<Input, Output> {
  Future<Output> call(Input input);
}

class NoOutput extends Equatable {
  @override
  List<Object> get props => [];
}

class NoInput extends Equatable {
  @override
  List<Object> get props => [];
}