import 'package:flutter/material.dart';

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
        title: const Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Macronutrients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Protein: $protein g'),
                Text('Carbs: $carbs g'),
                Text('Fats: $fats g'),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Calories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Target: $targetCalories kcal'),
                Text('Consumed: $consumedCalories kcal'),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const Text('Meals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(meals[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Card(
            child: Center(child: Text('TBD')),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Dashboard(),
//   ));
// }


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Example'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Dashboard Menu')
            ),
            ListTile(
              title: const Text('Dashboard Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text('Dashboard Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      body: const Dashboard()
    );
  }
}
