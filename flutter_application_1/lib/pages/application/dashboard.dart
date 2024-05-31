import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/application/meal_page.dart';
import '../profile_creation/meal_selection.dart';
import 'drawer.dart';
import 'package:flutter_application_1/pages/authentication/login_page.dart'; // Import login page

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
  int targetCalories = 2000;
  int consumedCalories = 0;
  List<String> meals = ['Breakfast', 'Lunch', 'Dinner'];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          meals[index],
                          style: const TextStyle(fontFamily: 'Roboto', color: Colors.black),
                        ),
                      );
                    },
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
            child: const Center(
              child: Text(
                'TBD',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
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

class AppDrawer extends StatelessWidget {
  final String uid;

  const AppDrawer({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 40, 81),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              // Navigate to home
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text(
              'Meal Selection',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MealPage(uid: uid)),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log Out',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")),
              );
            },
          ),
        ],
      ),
    );
  }
}
