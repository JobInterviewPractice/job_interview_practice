part of 'recordings_bloc.dart';

@immutable
abstract class RecordingsState {}

class RecordingsInitial extends RecordingsState {}
class Recordings extends RecordingsState {
  final List<RecordingItem> models;
  Recordings(this.models);
}

class Error extends RecordingsState {
  final String message;
  Error(this.message);
}

class RecordingItem {
  final RecordingModel model;
  final String title;

  RecordingItem(this.model, this.title);
}