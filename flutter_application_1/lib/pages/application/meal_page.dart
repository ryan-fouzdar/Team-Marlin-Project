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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    try {
      // Load user data from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.uid).get();
      User curUser = User.fromFirestore(userDoc);

      // Load meals from CSV
      List<Meal> meals = await loadMeals('/Users/nehem/development/Team-Marlin-Project/flutter_application_1/assets/dataset/gdsc_dataset.csv');

      // Get recommended meals
      List<Meal> sortedMeals = recommendMeals(curUser, meals, 10);

      setState(() {
        _meals = sortedMeals;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading meals: $e');
      setState(() {
        _isLoading = false;
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
                decoration: InputDecoration(
                  hintText: 'Search for meals...',
                  hintStyle: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  // Implement your search query logic here
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
                      itemCount: _meals.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.fastfood, color: Colors.white),
                          title: Text(
                            _meals[index].itemName,
                            style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
                          ),
                          subtitle: Text(
                            _meals[index].itemDescription,
                            style: const TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
                          ),
                          onTap: () {
                            showMealDetails(context, _meals[index]);
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
                // Implement what happens when the 'Add' button is clicked
                print('Meal ${meal.itemName} added');
                Navigator.of(context).pop(); // Closes the dialog
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