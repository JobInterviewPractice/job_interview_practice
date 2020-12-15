import 'package:job_interview_practice/feature/login/data/model/user_model.dart';
import 'package:job_interview_practice/feature/question/data/models/question_model.dart';

class QuestionUserModel {
  final QuestionModel questionModel;
  final UserModel userModel;

  QuestionUserModel({this.questionModel, this.userModel});
}