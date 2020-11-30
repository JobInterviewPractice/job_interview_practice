abstract class SettingsEvent {}

class ChangeNumberOfQuestion extends SettingsEvent {
  final int value;

  ChangeNumberOfQuestion(this.value);
}

class ChangeOnlyWeakSwitch extends SettingsEvent {
  final bool value;

  ChangeOnlyWeakSwitch(this.value);
}

class SetupSettingsEvent extends SettingsEvent {}
