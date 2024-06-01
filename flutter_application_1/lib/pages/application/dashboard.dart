import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/application/meal_page.dart';
import '../profile_creation/meal_selection.dart';
import 'drawer.dart';
import 'package:flutter_application_1/pages/authentication/login_page.dart'; // Import login page
import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  final String uid;

  const Dashboard({Key? key, required this.uid}) : super(key: key);

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  // Variables to hold the values
  double protein = 0;
  double carbs = 0;
  double fats = 0;
  double cholesterol = 0;
  double sodium = 0;
  double transFat = 0;
  double saturatedFat = 0;
  double dietaryFiber = 0;
  double sugar = 0;
  int targetCalories = 0;
  int consumedCalories = 0;
  String breakfastMeal = '';
  String lunchMeal = '';
  String dinnerMeal = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchConsumedMeals();
  }

  Future<void> _fetchConsumedMeals() async {
    try {
      DocumentSnapshot mealsDoc = await FirebaseFirestore.instance.collection('consumedMeals').doc(widget.uid).get();
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.uid).get();

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        targetCalories = (userData['calorieGoal'] as num).toInt();
      }

      if (mealsDoc.exists) {
        Map<String, dynamic> daysData = mealsDoc.data() as Map<String, dynamic>;

        String today = _formatDate(DateTime.now());

        if (daysData.containsKey('days')) {
          Map<String, dynamic> days = daysData['days'];
          if (days.containsKey(today)) {
            Map<String, dynamic> todayData = days[today];
            _processMealData(todayData);
          }
        }
      }
    } catch (e) {
      print('Error fetching consumed meals: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _processMealData(Map<String, dynamic> mealData) {
    if (mealData.containsKey('breakfast')) {
      _processSingleMeal(mealData['breakfast'], 'breakfast');
    }
    if (mealData.containsKey('lunch')) {
      _processSingleMeal(mealData['lunch'], 'lunch');
    }
    if (mealData.containsKey('dinner')) {
      _processSingleMeal(mealData['dinner'], 'dinner');
    }
  }

  void _processSingleMeal(Map<String, dynamic> meal, String mealType) {
    setState(() {
      if (mealType == 'breakfast') {
        breakfastMeal = meal['itemName'];
      } else if (mealType == 'lunch') {
        lunchMeal = meal['itemName'];
      } else if (mealType == 'dinner') {
        dinnerMeal = meal['itemName'];
      }

      protein += (meal['protein'] as num).toDouble();
      carbs += (meal['carbohydrates'] as num).toDouble();
      fats += (meal['totalFat'] as num).toDouble();
      cholesterol += (meal['cholesterol'] as num).toDouble();
      sodium += (meal['sodium'] as num).toDouble();
      transFat += (meal['transFat'] as num).toDouble();
      saturatedFat += (meal['saturatedFat'] as num).toDouble();
      dietaryFiber += (meal['dietaryFiber'] as num).toDouble();
      sugar += (meal['sugar'] as num).toDouble();
      consumedCalories += (meal['calories'] as num).toInt();
    });
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 2, 40, 81),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Macronutrients',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Protein: $protein g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Carbs: $carbs g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Fats: $fats g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Calories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Target: $targetCalories kcal',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Consumed: $consumedCalories kcal',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Meals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text(
                                'Breakfast: $breakfastMeal',
                                style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Lunch: $lunchMeal',
                                style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                'Dinner: $dinnerMeal',
                                style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Micronutrients',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Cholesterol: $cholesterol mg',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Sodium: $sodium mg',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Trans Fat: $transFat g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Saturated Fat: $saturatedFat g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Dietary Fiber: $dietaryFiber g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                      Text(
                        'Sugar: $sugar g',
                        style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class DashboardPage extends StatelessWidget {
  final String uid;

  const DashboardPage({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(uid: uid),
      body: Dashboard(uid: uid),
    );
  }
}

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 2, 40, 81),
//             ),
//             child: Text(
//               'Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontFamily: 'Roboto',
//               ),
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.home),
//             title: const Text(
//               'Home',
//               style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
//             ),
//             onTap: () {
//               // Navigate to home
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text(
//               'Settings',
//               style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
//             ),
//             onTap: () {
//               // Navigate to settings
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.fastfood),
//             title: const Text(
//               'Meal Selection',
//               style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const MealPage()),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.logout),
//             title: const Text(
//               'Log Out',
//               style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
//             ),
//             onTap: () {
//               FirebaseAuth.instance.signOut();
              // Navigator.pop(context); // Close the drawer
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")));
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
