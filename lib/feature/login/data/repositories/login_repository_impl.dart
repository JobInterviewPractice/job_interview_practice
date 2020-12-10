import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/services/remote_date_store.dart';
import 'package:job_interview_practice/feature/login/data/datasources/login_remote_data_source.dart';
import 'package:job_interview_practice/feature/login/data/model/user_model.dart';
import 'package:job_interview_practice/feature/login/domain/entities/login_entity.dart';
import 'package:job_interview_practice/feature/login/domain/entities/user_entity.dart';
import 'package:job_interview_practice/feature/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource dataSource;
  final RemoteDateStore remoteDateStore;

  LoginRepositoryImpl({this.dataSource, this.remoteDateStore});

  @override
  Future<Either<Failure, UserEntity>> login(LoginEntity input) async {
    try {
      final uid = await dataSource.signIn(email: input.email, password: input.password);
      final result = await dataSource.getUserInfoFromDbById(uid);
      return Right(result);
    } catch (e) {
      return Left(FirebaseWrappedError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(LoginEntity input) async {
    try {
      final uid = await dataSource.register(email: input.email, password: input.password);
      final mediaUrl = await remoteDateStore.uploadFile(input.filePath, uid);
      await dataSource.insertUser(UserModel(name: input.email, photoUrl: mediaUrl, userId: uid));
      final result = await dataSource.getUserInfoFromDbById(uid);
      return Right(result);
    } catch (e) {
      return Left(FirebaseWrappedError(e.toString()));
    }
  }
}
