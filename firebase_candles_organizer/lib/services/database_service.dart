import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_candles_organizer/models/scent.dart';

class DatabaseService {

  final String uid;

  DatabaseService({ required this.uid });

  // collection reference
  final CollectionReference testCollection = FirebaseFirestore.instance.collection('Test Collection');

  Future updateUserData(
      String name,
      String subtype,
      String description,
      int amount,
      int rating
      ) async {
    return await testCollection.doc(uid).set({
      'Name': name,
      'Subtype': subtype,
      'Description': description,
      'Amount': amount,
      'Rating': rating,
    });
  }

  List<Scent> _scentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Scent(
        name: doc.get('Name') ?? '',
        subtype: doc.get('Subtype') ?? '',
        description: doc.get('Description') ?? '',
        amount: doc.get('Amount') ?? 0,
        rating: doc.get('Rating') ?? 0,
      );
    }).toList();
  }

  Stream<List<Scent?>> get testData {
    return testCollection.snapshots()
    .map(_scentListFromSnapshot);

  }





}