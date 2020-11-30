abstract class SettingsEvent {}

class ChangeNumberOfQuestion extends SettingsEvent {
  final int value;

  ChangeNumberOfQuestion(this.value);
}

class ChangeOnlyWeekSwitch extends SettingsEvent {
  final bool value;

  ChangeOnlyWeekSwitch(this.value);
}

class SetupSettingsEvent extends SettingsEvent {}
