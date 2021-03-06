import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_candles_organizer/models/user.dart';
import 'package:firebase_candles_organizer/services/database_service.dart';
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
    return _auth.authStateChanges()
         .map(_userFromFirebaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
                                    email: email,
                                    password: password
                                    );
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
                                    email: email,
                                    password: password
                                    );
      User? user = result.user;
      // check whether user is valid
      if (user != null) {
        await DatabaseService(uid: user.uid).updateUserData('test', 'test', 'test', 0, 0);
      }

      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}