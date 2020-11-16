import 'package:job_interview_practice/domain/repository/question.dart';

class QuestionModel extends QuestionRepository{

  QuestionModel();

  String id;
  String questionText;
  bool isWeek;

  // todo:implementing after setting datastore.(firestore)
  @override
  QuestionModel selectByID(String id){}
  @override
  List<QuestionModel> selectAll(){}
}

