abstract class StartEvent {}

class NextQuestionEvent extends StartEvent {
  final int rate;
  NextQuestionEvent(this.rate);
}
