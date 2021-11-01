import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_candles_organizer/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Stack _buildBody() {
    return Stack(children: [
        ElevatedButton(
            onPressed: () async {
              User? result = await _auth.signInWithEmailAndPassword();
              if (result == null) {
                print("error signing in");
              } else {
                print(result.uid);
              }
            },
            child: const Text("Sign In"))
    ],);
  }
}
