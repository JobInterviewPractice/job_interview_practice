import 'package:flutter/foundation.dart';
import 'package:job_interview_practice/domain/entities/appSetting.dart';

class AppSettingModel extends AppSetting {
  AppSettingModel(
      {@required int questionNumber,
      @required bool isRecord,
      @required bool weakQuestionOnly});

  // factory GroupModel.fromJson(Map<String, dynamic> json)
  // => GroupModel(
  //     id: json["id"],
  //     name: json["name"],
  //     contactsCount: json["contacts_count"]
  // );
}
