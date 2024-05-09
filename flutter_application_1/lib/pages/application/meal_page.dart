import 'package:flutter/material.dart';
import 'drawer.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  MealPageState createState() => MealPageState();
}

class MealPageState extends State<MealPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hungry?'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for meals...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
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
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Placeholder for the number of meals
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.fastfood), // Placeholder icon
                  title: Text('Meal ${index + 1}'), // Placeholder title
                  subtitle: const Text('Meal description...'), // Placeholder subtitle
                  onTap: () {
                    showMealDetails(context, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }

  void showMealDetails(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Meal Details'), // Title of the dialog
        content: SingleChildScrollView( // Use SingleChildScrollView to allow scrolling inside the dialog
          child: ListBody(
            children: <Widget>[
              Text('Meal Name: Meal ${index + 1}'),
              Text('Description: This is a delicious meal...'),
              Text('Restaurant: Local Eatery'),
              Text('Calories: 250 kcal'),
              Text('Carbohydrates: 30g'),
              Text('Protein: 10g'),
              Text('Fats: 15g'),
              // Add more nutritional info or other details as needed
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Add'),
            onPressed: () {
              // Implement what happens when the 'Add' button is clicked
              print('Meal ${index + 1} added');
              Navigator.of(context).pop(); // Closes the dialog
            },
          ),
          TextButton(
            child: Text('Close'),
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
