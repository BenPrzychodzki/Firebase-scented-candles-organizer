import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_candles_organizer/services/auth_service.dart';
import 'package:firebase_candles_organizer/styles/loading_styles.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); /// Used for validating form data

  // text field state
  String email = '';
  String password = '';
  String error = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading ? const BuildLoadingScreen() : Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: const Text("Register")),
      ],
    );
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration( // TODO: Unify form look for all forms
                icon: Icon(Icons.alternate_email),
                labelText: "Email",
              ),
              validator: (String? val) => val!.isEmpty ? 'Enter an email' : null, // TODO: better validation func
              onChanged: (val) {
                setState(() => email = val);
              },),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                labelText: "Password",
              ),
              validator: (String? val) => val!.length < 6 ? 'Password must be at least six chars long' : null, // TODO: better validation func
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  // if all TextFormField validators will return null, it means that everything is valid
                  if(_formKey.currentState!.validate()) {
                    setState(() => isLoading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
                        isLoading = false;
                      }); // TODO: More detailed error messages
                    }
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white),
                )),
            Text(error),
          ],
        ),
      ),
    );
  }
}
