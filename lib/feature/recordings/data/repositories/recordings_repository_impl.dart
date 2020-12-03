import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/feature/recordings/data/datasources/recordings_local_data_source.dart';
import 'package:job_interview_practice/feature/recordings/domain/repositories/recordings_repository.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';

class RecordingsRepositoryImpl extends RecordingsRepository {
  final RecordingsLocalDataSource dataSource;

  RecordingsRepositoryImpl({this.dataSource});

  @override
  Future<Either<Failure, List<RecordingModel>>> getRecordings() async {
    try {
      final result = await dataSource.getRecordings();
      return Right(result);
    } catch (_) {
      return Left(LocalStorageFailure());
    }
  }
}
