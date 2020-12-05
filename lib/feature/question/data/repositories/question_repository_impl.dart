import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_interview_practice/feature/question/data/models/question.dart';
import 'package:job_interview_practice/feature/question/data/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  Future<List<QuestionModel>> selectAll() async {
    try {
      print("try fetch...");
      await Firebase.initializeApp();
      final FirebaseFirestore instance = FirebaseFirestore.instance;
      final groups = await instance.collection('questions').get();
      List<QueryDocumentSnapshot> response = groups.docs;
      List<QuestionModel> questionModels = [];
      for (int i = 0; i < 2; i++) {
        if (i >= response.length) break;
        questionModels.add(QuestionModel(response[i].get("id"),
            response[i].get("question_text"), response[i].get("is_weak")));
      }
      return questionModels;
    } catch (e) {
      print(e);
    }
  }

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

  Future<List<QuestionModel>> selectByRandom(int numberOfQuestion) async {
    try {
      await Firebase.initializeApp();
      final FirebaseFirestore instance = FirebaseFirestore.instance;
      final groups = await instance.collection('questions').get();
      List<QueryDocumentSnapshot> response = groups.docs;
      List<QuestionModel> questionModels = [];
      for (int i = 0; i < numberOfQuestion; i++) {
        if (i >= response.length) break;
        questionModels.add(QuestionModel(response[i].get("id"),
            response[i].get("question_text"), response[i].get("is_weak")));
      }
      return questionModels;
    } catch (e) {
      print("err!!!!!!");
      print(e);
    }
  }
}
