import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class SplashRemoteDataSource {
  Future<bool> isSignIn();
}

class SplashRemoteDataSourceImpl extends SplashRemoteDataSource {
  final auth.FirebaseAuth _auth;

  SplashRemoteDataSourceImpl(this._auth);

  Future<bool> isSignIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      return true;
    }
    return false;
  }
}
