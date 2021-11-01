import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference testCollection = FirebaseFirestore.instance.collection('Test Collection');

  Future updateUserData(String candles, String waxes, int amount) async {
    return await testCollection.doc(uid).set({
      'candles': candles,
      'waxes': waxes,
      'amount': amount,
    });
  }





}