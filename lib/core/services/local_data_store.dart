import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStore {
  SharedPreferences prefs;

  void connectToStore() async {
    this.prefs = await SharedPreferences.getInstance();
  }
}
