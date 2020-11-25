import 'package:shared_preferences/shared_preferences.dart';

class AppSettingService {
  SharedPreferences prefs;

  void connectToStore() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  int getSetting_NumberOfQuestion() {
    connectToStore();
    // todo: remove
    return 30;
  }

  Future setSetting_NumberOfQuestion(int number) {
    prefs.setInt('questionNumber', number);
  }

  bool getSetting_OnlyWeakQuestion() {
    connectToStore();
    // todo: remove
    return false;
  }

  Future setSetting_OnlyWeakQuestion(bool ok) {
    prefs.setBool('questionNumber', ok);
  }
}

class SettingService {}
