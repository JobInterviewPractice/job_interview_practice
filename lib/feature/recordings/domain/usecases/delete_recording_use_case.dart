import 'package:dartz/dartz.dart';
import 'package:job_interview_practice/core/error/failure.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';
import 'package:job_interview_practice/feature/recordings/domain/repositories/recordings_repository.dart';

class DeleteRecordingUseCase implements UseCase<String, NoOutput> {
  final RecordingsRepository repository;

  DeleteRecordingUseCase({this.repository});

  @override
  Future<Either<Failure, NoOutput>> call(String input) {
    return repository.deleteRecording(input);
  }
}