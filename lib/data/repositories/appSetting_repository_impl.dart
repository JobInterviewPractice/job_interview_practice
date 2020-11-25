import 'package:job_interview_practice/data/models/appSetting.dart';

abstract class AppSettingRepository {
  Future<AppSettingModel> updateSetting(String settingID, dynamic setting);
}

class AppSettingRepositoryImpl extends AppSettingRepository {
  //
  Future<AppSettingModel> updateSetting(String settingsID, dynamic setting) {}
}
