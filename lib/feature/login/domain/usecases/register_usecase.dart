import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/login/domain/entities/login_entity.dart';
import 'package:job_interview_practice/feature/login/domain/entities/user_entity.dart';
import 'package:job_interview_practice/feature/login/domain/repositories/login_repository.dart';

class RegisterUseCase implements UseCase<LoginEntity, UserEntity> {
  final LoginRepository repository;

  RegisterUseCase({this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(LoginEntity input) {
    return repository.register(input);
  }
}
