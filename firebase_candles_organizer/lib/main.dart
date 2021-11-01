import 'package:firebase_candles_organizer/pages/home_page.dart';
import 'package:firebase_candles_organizer/services/auth_service.dart';
import 'package:firebase_candles_organizer/utils/firebase_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); /// if Flutter needs to call native code before calling runApp,
  /// it makes sure that you have an instance of the WidgetsBinding, which is required to use platform channels to call the native code.
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().user,
      child: _buildAppCore(),
    );
  }

  MaterialApp _buildAppCore() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Candles Organizer",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
        ),
      ),
      home: const Wrapper(),
    );
  }
}


