import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/feature/splash/data/datasources/splash_remote_data_source.dart';
import 'package:job_interview_practice/feature/splash/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl extends SplashRepository {
  final SplashRemoteDataSource dataSource;
  SplashRepositoryImpl({this.dataSource});

  @override
  Future<Either<Failure, bool>> isSignIn() async {
    try {
      final result = await dataSource.isSignIn();
      return Right(result);
    } catch (_) {
      return Left(UnauthorizedFailure());
    }
  }
}
