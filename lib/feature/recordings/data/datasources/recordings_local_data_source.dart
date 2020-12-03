import 'package:job_interview_practice/core/local_storage/db_wrapper.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';

abstract class RecordingsLocalDataSource {
  Future<List<RecordingModel>> getRecordings();
}

class RecordingsLocalDataSourceImpl extends RecordingsLocalDataSource {
  final DBWrapper dbWrapper;
  RecordingsLocalDataSourceImpl(this.dbWrapper);

  Future<List<RecordingModel>> getRecordings() async {
    return dbWrapper.getRecordings();
  }
}
