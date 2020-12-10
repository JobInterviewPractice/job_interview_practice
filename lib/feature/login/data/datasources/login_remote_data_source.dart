import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_interview_practice/feature/login/data/model/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<String> register({String email, String password});
  Future<String> signIn({String email, String password});
  Future<void> insertUser(UserModel user);
  Future<UserModel> getUserInfoFromDbById(String userId);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final auth.FirebaseAuth _auth;
  final FirebaseFirestore _store;

  LoginRemoteDataSourceImpl(this._auth, this._store);

  Future<String> register({String email, String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> signIn({String email, String password}) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> insertUser(UserModel user) async {
    await _store.collection("users").doc(user.userId).set(user.toMap());
  }

  Future<UserModel> getUserInfoFromDbById(String userId) async {
    final query = await _store.collection("users").where("userId", isEqualTo: userId).get();
    return UserModel.fromMap(query.docs[0].data());
  }
}
