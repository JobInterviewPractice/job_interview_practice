import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/recordings/domain/repositories/recordings_repository.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';

class GetRecordingsUseCase implements UseCase<NoInput, List<RecordingModel>> {
  final RecordingsRepository repository;

  GetRecordingsUseCase({this.repository});

  @override
  Future<Either<Failure, List<RecordingModel>>> call(NoInput input) {
    return repository.getRecordings();
  }
}
