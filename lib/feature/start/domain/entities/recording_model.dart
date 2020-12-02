import 'package:hive/hive.dart';

part 'recording_model.g.dart';

@HiveType(typeId: 0)
class RecordingModel extends HiveObject {
  @HiveField(0)
  final List<String> questions;

  @HiveField(1)
  final String videoPath;

  RecordingModel({this.questions, this.videoPath});
}
