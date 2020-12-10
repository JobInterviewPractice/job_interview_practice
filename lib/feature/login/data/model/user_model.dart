import 'package:job_interview_practice/feature/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({String userId, String name, String photoUrl}) : super(userId: userId, photoUrl: photoUrl, name: name);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(userId: map['userId'] as String, name: map['name'] as String, photoUrl: map['photoUrl'] as String);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': this.userId,
      'name': this.name,
      'photoUrl': this.photoUrl,
    };
  }
}
