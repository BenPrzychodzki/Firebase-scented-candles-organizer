import 'package:firebase_candles_organizer/pages/authentication/sign_in_widget.dart';
import 'package:flutter/material.dart';

class AuthenticatePage extends StatefulWidget {
  const AuthenticatePage({Key? key}) : super(key: key);

  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
