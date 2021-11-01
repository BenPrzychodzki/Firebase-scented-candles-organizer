import 'package:firebase_candles_organizer/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        _buildLogoutButton()]
    );
  }

  Stack _buildBody() {
    return Stack(children: const [
      Center(child: Text("Home Page"),)
    ],);
  }

  TextButton _buildLogoutButton() {
    return TextButton(
      onPressed: () async {
        await _auth.signOut();
      },
      child: const Text("Logout"),
    );
  }
}

