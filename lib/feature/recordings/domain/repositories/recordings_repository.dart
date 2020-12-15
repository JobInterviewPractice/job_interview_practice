import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';

abstract class RecordingsRepository {
  Future<Either<Failure, List<RecordingModel>>> getRecordings();
  Future<Either<Failure, NoOutput>> deleteRecording(String id);
}
