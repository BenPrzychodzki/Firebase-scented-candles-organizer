import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuildLoadingScreen extends StatelessWidget {
  const BuildLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: const Center(
        child: SpinKitFadingCube(
          color: Colors.brown,
          size: 50.0,
        ),
      ),
    );
  }
}