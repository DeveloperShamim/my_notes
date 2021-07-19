import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_notes/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Create user object based on FirebaseUser to Local User
  User _userFronFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//Change auth user Stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFronFirebaseUser);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      //print(user.toString());
      return _userFronFirebaseUser(user);
    } catch (e) {}
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userFronFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _userFronFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
