part of 'recordings_bloc.dart';

@immutable
class RecordingsEvent {}

class DeleteRecording extends RecordingsEvent {
  final String recordingId;
  DeleteRecording(this.recordingId);
}
