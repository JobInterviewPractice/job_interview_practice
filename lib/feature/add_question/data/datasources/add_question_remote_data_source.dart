import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_interview_practice/core/logic/usecase.dart';

abstract class AddQuestionRemoteDataSource {
  Future<NoOutput> addQuestion(String questionText);
}

class AddQuestionRemoteDataSourceImpl extends AddQuestionRemoteDataSource {
  final FirebaseFirestore _store;

  AddQuestionRemoteDataSourceImpl(this._store);

  @override
  Future<NoOutput> addQuestion(String questionText) async {
    final auth = FirebaseAuth.instance.currentUser;

    await _store
        .collection("questions")
        .add({'createdAt': Timestamp.now(), 'questionText': questionText, 'userid': auth.uid, 'rate': []});
    return NoOutput();
  }
}
