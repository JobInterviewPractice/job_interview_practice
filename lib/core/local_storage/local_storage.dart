import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<bool> getBoolData(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool(key);
  }

  Future<void> setBoolData(String key, bool value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setBool(key, value);
  }

  Future<int> getIntData(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getInt(key);
  }

  Future<void> setIntData(String key, int value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setInt(key, value);
  }
}
