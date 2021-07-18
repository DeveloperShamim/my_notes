import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_notes/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFronFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print(user.toString());
      return _userFronFirebaseUser(user);
    } catch (e) {}
  }
}
