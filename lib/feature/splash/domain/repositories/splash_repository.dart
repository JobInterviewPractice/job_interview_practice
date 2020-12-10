import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure,  bool>> isSignIn();
}
