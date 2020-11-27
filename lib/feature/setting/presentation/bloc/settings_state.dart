abstract class SettingsState {}

class LoadingSettingsState extends SettingsState {}

class LoadedSettingsStateDropdown extends SettingsState {
  final int dropdownValue;

  LoadedSettingsStateDropdown({this.dropdownValue});
}

class LoadedSettingsStateSwitch extends SettingsState {
  final bool onlyWeak;

  LoadedSettingsStateSwitch({this.onlyWeak});
}
