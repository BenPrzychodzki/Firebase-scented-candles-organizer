import 'package:firebase_candles_organizer/models/scent.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CandleList extends StatefulWidget {
  const CandleList({Key? key}) : super(key: key);

  @override
  _CandleListState createState() => _CandleListState();
}

class _CandleListState extends State<CandleList> {
  @override
  Widget build(BuildContext context) {

    final input = Provider.of<List<Scent?>>(context);

    // for (var doc in input!.docs) {
    //   print(doc.data());
    // }

    return Center(
      child: Column(
        children: [
          Text(input[0]!.name),
          Text(input[0]!.subtype),
          Text(input[0]!.description),
          Text(input[0]!.amount.toString()),
          Text(input[0]!.rating.toString()),


        ],
      ),
    );
  }

  _buildAddCollectionButton() {

  }
}
