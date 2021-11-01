import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
    return Stack(children: const [
      Center(
        child: Text("Login Page")
      )
    ]);
  }
}
