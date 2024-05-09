import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class FirestoreService {
  // Singleton pattern
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<String> getMenuItems() async {
  //   QuerySnapshot querySnapshot = await _db.collection('menu_items').get();

  //   List<Map<String, dynamic>> menuItemsList = [];
  //   querySnapshot.docs.forEach((document) {
  //     List<dynamic> meals = document.data()['meals'];
  //     meals.forEach((meal) {
  //       // Here you can access individual meal data and add it to a list
  //       menuItemsList.add({
  //         'food_category': meal['food_category'],
  //         'name': meal['name'],
  //         'description': meal['description'],
  //         'calories': meal['calories'],
  //         'total_fat': meal['total_fat'],
  //         'protein': meal['protein'],

          
  //       });
  //     });
  //   });

  //   return jsonEncode(menuItemsList);
  // }

  // Future<String> getRestaurantsAsJson() async {
  //   QuerySnapshot querySnapshot = await _db.collection('restaurants').get();

  //   List<Map<String, dynamic>> restaurantsList = [];
  //   querySnapshot.docs.forEach((document) {
  //     // Convert each document data to a map
  //     Map<String, dynamic> restaurantData = document.data();
  //     restaurantData['id'] = document.id; // Include document ID in the data
  //     restaurantsList.add(restaurantData);
  //   });

  //   // Convert the list of maps to a JSON string
  //   return jsonEncode(restaurantsList);
  // }
}
