import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/splash/domain/repositories/splash_repository.dart';

class SplashUseCase implements UseCase<NoInput, bool> {
  final SplashRepository repository;
  SplashUseCase({this.repository});

  @override
  Future<Either<Failure, bool>> call(NoInput input) {
    return repository.isSignIn();
  }
}
