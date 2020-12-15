import 'package:hive/hive.dart';
import 'package:job_interview_practice/feature/start/domain/entities/recording_model.dart';
import 'package:path_provider/path_provider.dart';

const String RECORDINGS = "RECORDINGS";

class DBWrapper {
  DBWrapper() {
    _setup();
  }

  Future<void> _setup() async {
    final document = await getApplicationDocumentsDirectory();
    Hive.init(document.path);
    Hive.registerAdapter(RecordingModelAdapter());
    await Hive.openBox<RecordingModel>(RECORDINGS);
  }

  List<RecordingModel> getRecordings() {
    final recordingsBox = Hive.box<RecordingModel>(RECORDINGS);
    return recordingsBox.keys.map<RecordingModel>((e) => recordingsBox.get(e)).toList();
  }

  Future<void> deleteRecordings(String id) async {
    final recordings = getRecordings();
    final index = recordings.indexWhere((element) => element.videoPath == id);
    final recordingsBox = Hive.box<RecordingModel>(RECORDINGS);
    recordingsBox.deleteAt(index);
  }
}