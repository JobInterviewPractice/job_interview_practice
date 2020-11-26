import 'package:flutter/foundation.dart';
import 'package:job_interview_practice/feature/setting/domain/entity/setting.dart';

class SettingModel extends Setting {
  SettingModel({
    @required String value,
    @required String name,
  }) : super(name: name, value: value);
}
