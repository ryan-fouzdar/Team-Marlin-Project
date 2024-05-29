import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

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

  // Example method to add a user document
  Future<void> addUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(uid).set(userData);
      print('User added successfully');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // // Example method to get a user document
  // Future<DocumentSnapshot> getUser(String uid) async {
  //   try {
  //     DocumentSnapshot userDoc = await _db.collection('users').doc(uid).get();
  //     return userDoc;
  //   } catch (e) {
  //     print('Error getting user: $e');
  //     rethrow;
  //   }
  // }

  // // Example method to update a user document
  // Future<void> updateUser(String uid, Map<String, dynamic> userData) async {
  //   try {
  //     await _db.collection('users').doc(uid).update(userData);
  //     print('User updated successfully');
  //   } catch (e) {
  //     print('Error updating user: $e');
  //   }
  // }

  // // Example method to delete a user document
  // Future<void> deleteUser(String uid) async {
  //   try {
  //     await _db.collection('users').doc(uid).delete();
  //     print('User deleted successfully');
  //   } catch (e) {
  //     print('Error deleting user: $e');
  //   }
  // }
}