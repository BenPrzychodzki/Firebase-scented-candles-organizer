import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_candles_organizer/models/scent.dart';
import 'package:firebase_candles_organizer/pages/home_widgets/list_view.dart';
import 'package:firebase_candles_organizer/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_candles_organizer/services/database_service.dart';
import 'package:provider/provider.dart';


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

  Container _buildBody() {
    return Container(
      child: StreamProvider<List<Scent?>>.value( // listening for changes in database
        initialData: const [],
        value: DatabaseService(uid: '').testData,
        child: CandleList(),
      ),
    );
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

