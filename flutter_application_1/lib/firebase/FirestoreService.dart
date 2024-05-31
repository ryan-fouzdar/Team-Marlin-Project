import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Private constructor
  FirestoreService._internal();

  // Singleton instance
  static final FirestoreService _instance = FirestoreService._internal();

  // Factory constructor
  factory FirestoreService() => _instance;

  // Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Public getter to access the Firestore instance
  FirebaseFirestore get db => _db;

  // Method to add a user document
  Future<void> addUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(uid).set(userData);
      print('User added successfully');
    } catch (e) {
      print('Error adding user: $e');
    }
  }
}
