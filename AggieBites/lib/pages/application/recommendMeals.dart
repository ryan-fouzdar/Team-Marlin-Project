import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:csv/csv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int calorieGoal;
  final int proteinGoal;
  final int fatGoal;
  final int carbGoal;
  final int mealsEaten;
  final int totalMeals;

  User({
    required this.calorieGoal,
    required this.proteinGoal,
    required this.fatGoal,
    required this.carbGoal,
    required this.mealsEaten,
  }) : totalMeals = 3;

  factory User.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return User(
      calorieGoal: data['calorieGoal'] ?? 0,
      proteinGoal: data['proteinGoal'] ?? 0,
      fatGoal: data['fatGoal'] ?? 0,
      carbGoal: data['carbGoal'] ?? 0,
      mealsEaten: 0, // Initialize mealsEaten to 0 for now
    );
  }
}

class Meal {
  final String foodCategory;
  final String restaurant;
  final String itemName;
  final String itemDescription;
  final double calories;
  final double totalFat;
  final double saturatedFat;
  final double transFat;
  final double cholesterol;
  final double sodium;
  final double carbohydrates;
  final double dietaryFiber;
  final double sugar;
  final double protein;
  double distance; // This will be used for sorting

  Meal({
    required this.foodCategory,
    required this.restaurant,
    required this.itemName,
    required this.itemDescription,
    required this.calories,
    required this.totalFat,
    required this.saturatedFat,
    required this.transFat,
    required this.cholesterol,
    required this.sodium,
    required this.carbohydrates,
    required this.dietaryFiber,
    required this.sugar,
    required this.protein,
    this.distance = 0.0,
  });
}

double euclideanDistanceMetric(User user, Meal meal) {
  double weightCalories = 3.0;
  double weightProtein = 3.0;
  double weightFats = 1.5;
  double weightCarbs = 2.0;
  double metric = sqrt(
    pow(weightCalories * ((user.calorieGoal / (user.totalMeals - user.mealsEaten)) - meal.calories), 2) +
    pow(weightProtein * ((user.proteinGoal / (user.totalMeals - user.mealsEaten)) - meal.protein), 2) +
    pow(weightFats * ((user.fatGoal / (user.totalMeals - user.mealsEaten)) - meal.totalFat), 2) +
    pow(weightCarbs * ((user.carbGoal / (user.totalMeals - user.mealsEaten)) - meal.carbohydrates), 2)
  );
  return metric;
}

double safeParseDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.tryParse(value) ?? 0.0; // Return 0.0 if parsing fails
  }
  return 0.0;
}

Future<List<Meal>> loadMeals(String path) async {
  final input = await File(path).readAsString();
  List<List<dynamic>> fields = const CsvToListConverter().convert(input);

  // Remove the header row if necessary
  fields.removeAt(0);

  // Convert to List<Meal>
  List<Meal> meals = fields.map<Meal>((row) {
    return Meal(
      foodCategory: row[0].toString(),
      restaurant: row[1].toString(),
      itemName: row[2].toString(),
      itemDescription: row[3].toString(),
      calories: safeParseDouble(row[4]),
      totalFat: safeParseDouble(row[5]),
      saturatedFat: safeParseDouble(row[6]),
      transFat: safeParseDouble(row[7]),
      cholesterol: safeParseDouble(row[8]),
      sodium: safeParseDouble(row[9]),
      carbohydrates: safeParseDouble(row[10]),
      dietaryFiber: safeParseDouble(row[11]),
      sugar: safeParseDouble(row[12]),
      protein: safeParseDouble(row[13]),
    );
  }).toList();

  return meals;
}

List<Meal> recommendMeals(User user, List<Meal> meals, int numRecommendations) {
  // Calculate distances for each meal
  for (var meal in meals) {
    meal.distance = euclideanDistanceMetric(user, meal);
  }

  // Sort meals by distance
  meals.sort((a, b) => a.distance.compareTo(b.distance));

  // Return the top recommendations
  return meals.take(numRecommendations).toList();
}

Future<void> main() async {
  // Example uid for testing
  String uid = 'exampleUid';

  // Load user data from Firestore
  DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  User curUser = User.fromFirestore(userDoc);

  int numRecommendations = 3;

  // Load meals from CSV
  List<Meal> meals = await loadMeals('../assets/dataset/gdsc_dataset.csv');

  // Get recommended meals
  List<Meal> sortedMeals = recommendMeals(curUser, meals, numRecommendations);

  for (var meal in sortedMeals) {
    print('Meal Name: ${meal.itemName}');
    print('Description: ${meal.itemDescription}');
    print('Restaurant: ${meal.restaurant}');
    print('Calories: ${meal.calories}');
    print('Carbohydrates: ${meal.carbohydrates}');
    print('Protein: ${meal.protein}');
    print('Fats: ${meal.totalFat}');
    print('---');
  }
}