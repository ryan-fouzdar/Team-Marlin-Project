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
                    // Implement your navigation or action here
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
