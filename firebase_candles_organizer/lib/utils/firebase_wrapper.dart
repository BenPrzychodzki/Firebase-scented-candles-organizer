import 'package:firebase_candles_organizer/models/user.dart';
import 'package:firebase_candles_organizer/pages/authentication/authenticate_page.dart';
import 'package:firebase_candles_organizer/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);


    // return either Home or Auth page
    if (user == null) {
      return const AuthenticatePage();
    } else {
      return const HomePage();
    }
  }
}
