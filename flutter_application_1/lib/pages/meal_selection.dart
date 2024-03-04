import 'package:flutter/material.dart';

class MealSelection extends StatelessWidget {
  @override
  const MealSelection({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MealPreferencesPage(),
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
    'Pizza',
    'Seafood',
    'Vegan',
    'Meat',
    'Ramen',
    'Burgers',
    'Cafe',
    'Drinks',
    'Breakfast',
    'Lunch',
    'Dinner',
    'Dessert',
  ];
  final List<IconData> icons = const [
    Icons.local_pizza,
    Icons.set_meal,
    Icons.eco,
    Icons.restaurant,
    Icons.ramen_dining,
    Icons.lunch_dining,
    Icons.local_cafe,
    Icons.local_drink,
    Icons.free_breakfast,
    Icons.lunch_dining,
    Icons.dinner_dining,
    Icons.cake,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text('Food Preferences')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'We are sure you will find your favorites.',
              style: TextStyle(fontSize: 20.0), // Adjust the font size if necessary
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
                          ? Border.all(color: Colors.blue, width: 2)
                          : Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          color: isSelected[index] ? Colors.blue : null,
                          size: 30.0,
                        ),
                        Text(
                          labels[index],
                          style: TextStyle(
                            color: isSelected[index] ? Colors.blue : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}