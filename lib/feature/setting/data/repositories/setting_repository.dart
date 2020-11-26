import 'package:job_interview_practice/feature/setting/data/models/setting.dart';

abstract class SettingRepository {
  List<SettingModel> selectAll();
  SettingModel selectBykey(String key);
  void updateSetting(String key, String value);
}
