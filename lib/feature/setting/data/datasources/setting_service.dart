import 'package:job_interview_practice/feature/setting/data/models/setting.dart';
import 'package:job_interview_practice/feature/setting/data/repositories/setting_repository_impl.dart';

class SettingService {
  SettingRepositoryImpl settingRepository;

  dynamic getSettingValue(String settingName) {
    SettingModel setting = settingRepository.selectBykey(settingName);

    if (settingName == 'NumberOfQuestion') {
      return int.parse(setting.value);
    }
    if (settingName == 'OnlyWeekQuestion') {
      return toBoolean(setting.value);
    }
    return setting.value;
  }

  void setSettingValue(String settingName, dynamic value) {
    settingRepository = SettingRepositoryImpl();
    settingRepository.updateSetting(settingName, value.toString());
  }

  bool toBoolean(String str, [bool strict]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }
}
