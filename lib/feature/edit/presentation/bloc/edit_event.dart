abstract class EditEvent {}

class SetupEditEvent extends EditEvent {}

class ChangeQuestion extends EditEvent {
  final editedText;
  ChangeQuestion({this.editedText});
}

class PushAddButton extends EditEvent {}
