import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_candles_organizer/models/user.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserModel?> get user {
   // return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword() async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: "example", password: "example");
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // register with email and password

  // sign out

}