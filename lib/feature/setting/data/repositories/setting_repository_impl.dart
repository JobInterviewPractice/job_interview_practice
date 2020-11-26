import 'package:job_interview_practice/core/services/local_data_store.dart';
import 'package:job_interview_practice/feature/setting/data/models/setting.dart';
import 'package:job_interview_practice/feature/setting/data/repositories/setting_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepositoryImpl implements SettingRepository {
  // appの起動時に呼ばれる想定。全ての設定情報を持ったインスタンスをサービスで作成するため、
  // ここではdatastoreからsettingmodelを撮ってくる
  List<SettingModel> selectAll() {
    LocalDataStore localStore = LocalDataStore()..connectToStore();
    localStore.prefs.get('questionNumber');
  }

  SettingModel selectBykey(String key) {
    LocalDataStore localStore = LocalDataStore()..connectToStore();
    String value = localStore.prefs.getString(key);
    return SettingModel(value: value, name: key);
  }

  void updateSetting(String key, String value) async {
    LocalDataStore localStore = LocalDataStore()..connectToStore();
    localStore.prefs = await SharedPreferences.getInstance();
    localStore.prefs.setString(key, value);
  }
}
