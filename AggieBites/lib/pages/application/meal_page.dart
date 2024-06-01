import 'package:flutter/material.dart';
import 'recommendMeals.dart'; // Adjust import path as necessary
import 'drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MealPage extends StatefulWidget {
  final String uid;

  const MealPage({Key? key, required this.uid}) : super(key: key);

  @override
  MealPageState createState() => MealPageState();
}

class MealPageState extends State<MealPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Meal> _meals = [];
  List<Meal> _recommendedMeals = [];
  bool _isLoading = true;
  User? _curUser;

  @override
  void initState() {
    super.initState();
    _loadMeals();
    _searchController.addListener(_filterMeals);
  }

  Future<void> _loadMeals() async {
    try {
      // Load user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.uid).get();
      _curUser = User.fromFirestore(userDoc);

      // Load meals from CSV
      List<Meal> meals = await loadMeals('AggieBites/assets/dataset/gdsc_dataset.csv');

      // Get recommended meals
      List<Meal> sortedMeals = recommendMeals(_curUser!, meals, 10);

      setState(() {
        _meals = meals;
        _recommendedMeals = sortedMeals;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading meals: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterMeals() {
    if (_curUser == null) return;

    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _recommendedMeals = recommendMeals(_curUser!, _meals, 10);
      });
    } else {
      setState(() {
        _recommendedMeals = _meals.where((meal) {
          return meal.itemName.toLowerCase().contains(query) || meal.restaurant.toLowerCase().contains(query);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hungry?",
          style: TextStyle(color: Color.fromARGB(255, 2, 40, 81)),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 2, 40, 81),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFieldContainer(
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                decoration: const InputDecoration(
                  hintText: 'Search for meals...',
                  hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  _filterMeals();
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Don't know what to eat? We got you.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _recommendedMeals.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.fastfood, color: Colors.white),
                          title: Text(
                            _recommendedMeals[index].itemName,
                            style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
                          ),
                          subtitle: Text(
                            _recommendedMeals[index].itemDescription,
                            style: const TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
                          ),
                          onTap: () {
                            showMealDetails(context, _recommendedMeals[index]);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(uid: widget.uid),
    );
  }

  void showMealDetails(BuildContext context, Meal meal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Meal Details',
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Meal Name: ${meal.itemName}', style: const TextStyle(fontFamily: 'Roboto')),
                Text('Description: ${meal.itemDescription}', style: const TextStyle(fontFamily: 'Roboto')),
                Text('Restaurant: ${meal.restaurant}', style: const TextStyle(fontFamily: 'Roboto')),
                Text('Calories: ${meal.calories}', style: const TextStyle(fontFamily: 'Roboto')),
                Text('Carbohydrates: ${meal.carbohydrates}', style: const TextStyle(fontFamily: 'Roboto')),
                Text('Protein: ${meal.protein}', style: const TextStyle(fontFamily: 'Roboto')),
                Text('Fats: ${meal.totalFat}', style: const TextStyle(fontFamily: 'Roboto')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add', style: TextStyle(fontFamily: 'Roboto')),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
                showAddMealOptions(context, meal); // Show add meal options
              },
            ),
            TextButton(
              child: const Text('Close', style: TextStyle(fontFamily: 'Roboto')),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void showAddMealOptions(BuildContext context, Meal meal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add Meal to',
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: const Text('Breakfast', style: TextStyle(fontFamily: 'Roboto')),
                  onTap: () {
                    // Handle adding meal to breakfast
                    Navigator.of(context).pop(); // Closes the dialog
                    addMealToFirestore(meal, 'breakfast');
                  },
                ),
                ListTile(
                  title: const Text('Lunch', style: TextStyle(fontFamily: 'Roboto')),
                  onTap: () {
                    // Handle adding meal to lunch
                    Navigator.of(context).pop(); // Closes the dialog
                    addMealToFirestore(meal, 'lunch');
                  },
                ),
                ListTile(
                  title: const Text('Dinner', style: TextStyle(fontFamily: 'Roboto')),
                  onTap: () {
                    // Handle adding meal to dinner
                    Navigator.of(context).pop(); // Closes the dialog
                    addMealToFirestore(meal, 'dinner');
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close', style: TextStyle(fontFamily: 'Roboto')),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
              },
            ),
          ],
        );
      },
    );
  }

  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(fontFamily: 'Roboto')),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void addMealToFirestore(Meal meal, String mealType) async {
    try {
      String uid = widget.uid;
      String today = formatDate(DateTime.now());

      DocumentReference userDocRef = FirebaseFirestore.instance.collection('consumedMeals').doc(uid);

      Map<String, dynamic> mealData = {
        'foodCategory': meal.foodCategory,
        'restaurant': meal.restaurant,
        'itemName': meal.itemName,
        'itemDescription': meal.itemDescription,
        'calories': meal.calories,
        'totalFat': meal.totalFat,
        'saturatedFat': meal.saturatedFat,
        'transFat': meal.transFat,
        'cholesterol': meal.cholesterol,
        'sodium': meal.sodium,
        'carbohydrates': meal.carbohydrates,
        'dietaryFiber': meal.dietaryFiber,
        'sugar': meal.sugar,
        'protein': meal.protein,
      };

      await userDocRef.set({
        'days': {
          today: {
            mealType: mealData,
          }
        }
      }, SetOptions(merge: true));

      showSnackbar(context, 'Meal ${meal.itemName} added to $mealType');
    } catch (e) {
      print('Error adding meal to Firestore: $e');
      showSnackbar(context, 'Error adding meal to $mealType');
    }
  }

  String formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  // void showSnackbar(BuildContext context, String message) {
  //   final snackBar = SnackBar(
  //     content: Text(message, style: const TextStyle(fontFamily: 'Roboto')),
  //     duration: const Duration(seconds: 2),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: child,
    );
  }
}