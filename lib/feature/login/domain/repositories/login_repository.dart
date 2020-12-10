import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/feature/login/domain/entities/login_entity.dart';
import 'package:job_interview_practice/feature/login/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> login(LoginEntity input);
  Future<Either<Failure, UserEntity>> register(LoginEntity input);
}
