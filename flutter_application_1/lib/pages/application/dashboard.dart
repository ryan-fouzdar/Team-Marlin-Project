import 'package:flutter/material.dart';
import '../profile_creation/meal_selection.dart';
import 'drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  const Dashboard({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Color.fromARGB(255, 2, 40, 81),
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
                      color: Colors.black, // Black font color
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Protein: $protein g',
                    style: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
                  ),
                  Text(
                    'Carbs: $carbs g',
                    style: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
                  ),
                  Text(
                    'Fats: $fats g',
                    style: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
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
                      color: Colors.black, // Black font color
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Target: $targetCalories kcal',
                    style: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
                  ),
                  Text(
                    'Consumed: $consumedCalories kcal',
                    style: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
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
                      color: Colors.black, // Black font color
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: meals.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            meals[index],
                            style: const TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
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
                    color: Colors.black, // Black font color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard Example',
          style: TextStyle(
            color: Color.fromARGB(255, 2, 40, 81),
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      drawer: const AppDrawer(),
      body: const Dashboard(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
            ),
            onTap: () {
              // Navigate to home
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black), // Black font color
            ),
            onTap: () {
              // Navigate to settings
            },
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../profile_creation/meal_selection.dart';
// import 'drawer.dart';

// class Dashboard extends StatefulWidget {
//   @override
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   DashboardState createState() => DashboardState();
// }

// class DashboardState extends State<Dashboard> {
//   // Variables to hold the values
//   double protein = 0;
//   double carbs = 0;
//   double fats = 0;
//   int targetCalories = 2000;
//   int consumedCalories = 0;
//   List<String> meals = ['Breakfast', 'Lunch', 'Dinner'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         automaticallyImplyLeading: false,
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         children: <Widget>[
//           Card(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Macronutrients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 Text('Protein: $protein g'),
//                 Text('Carbs: $carbs g'),
//                 Text('Fats: $fats g'),
//               ],
//             ),
//           ),
//           Card(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Calories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 Text('Target: $targetCalories kcal'),
//                 Text('Consumed: $consumedCalories kcal'),
//               ],
//             ),
//           ),
//           Card(
//             child: Column(
//               children: [
//                 const Text('Meals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: meals.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(meals[index]),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Card(
//             child: Center(child: Text('TBD')),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DashboardPage extends StatelessWidget {
//   const DashboardPage({Key? key}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard Example'),
//       ),
//       drawer: const AppDrawer(),
//       body: const Dashboard()
//     );
//   }
// }
