import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_interview_practice/data/models/question.dart';
import 'package:job_interview_practice/data/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  // todo:implementing after setting datastore.(firestore)

  Future<QuestionModel> selectByID(String questionID) async {
    try {
      await Firebase.initializeApp();
      final FirebaseFirestore instance = FirebaseFirestore.instance;
      final groups = await instance.collection('questions').get();

      // todo: remove hard cording
      QueryDocumentSnapshot response =
          groups.docs.firstWhere((element) => element.get("id") == questionID);
      return QuestionModel(response.get("id"), response.get("question_text"),
          response.get("is_weak"));
    } catch (e) {
      print(e);
    }
  }

  List<QuestionModel> selectAll() {}
}
