import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Singleton pattern
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // // Example of a function to fetch data
  // Future<DocumentSnapshot> getUser(String userId) async {
  //   return _db.collection('users').doc(userId).get();
  // }
}