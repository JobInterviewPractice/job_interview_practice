abstract class StartEvent {}

class SetupStartEvent extends StartEvent {}

class NextStartEvent extends StartEvent {
  NextStartEvent();
}
