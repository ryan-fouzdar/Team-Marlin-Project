import 'package:flutter/material.dart';
import 'package:flutter_application_1/misc/colors.dart';
import '../application/dashboard.dart';

class MealSelection extends StatelessWidget {
  @override
  const MealSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MealPreferencesPage(),
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 2, 40, 81),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}

class _MealPreferencesPage extends StatefulWidget {
  @override
  _MealPreferencesPageState createState() => _MealPreferencesPageState();
}

class _MealPreferencesPageState extends State<_MealPreferencesPage> {
  final List<bool> isSelected = List.generate(12, (_) => false);
  final List<String> labels = const [
    'Soup',
    'Salads',
    'Sandwiches',
    'Burgers',
    'Entrees',
    'Appetizers/Sides',
    'Fried Potatoes',
    'Desserts',
    'Beverages',
    'Baked Goods',
    'Pizza'
];

final List<String> icons = const [
    'assets/icons/soup-icon.png',
    'assets/icons/salad-icon.png',
    'assets/icons/sandwich-icon.png',
    'assets/icons/burger-icon.png',
    'assets/icons/entree-icon.png',
    'assets/icons/appetizer-icon.png',
    'assets/icons/potato-icon.png',
    'assets/icons/dessert-icon.png',
    'assets/icons/beverage-icon.png',
    'assets/icons/baked-icon.png',
    'assets/icons/pizza-icon.png'
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Preferences',
          style: TextStyle(
            color: Color.fromARGB(255, 2, 40, 81),
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      body: Container(
        color: const Color.fromARGB(255, 2, 40, 81),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'We are sure you will find your favorites.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: labels.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: isSelected[index]
                            ? Border.all(color: const Color.fromARGB(255, 209, 163, 15), width: 2)
                            : Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected[index] ? Colors.white : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            icons[index], // Use image asset path from the list
                            color: isSelected[index] ? const Color.fromARGB(255, 2, 40, 81) : Colors.white, // Apply color filter if needed
                            width: 30.0, // Set width for consistency
                            height: 30.0, // Set height for consistency
                            fit: BoxFit.cover, // Ensures the image covers the box, adjust as needed
                          ),
                          Text(
                            labels[index],
                            style: TextStyle(
                              color: isSelected[index] ? const Color.fromARGB(255, 2, 40, 81) : Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DashboardPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD1A30F),
                  padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
