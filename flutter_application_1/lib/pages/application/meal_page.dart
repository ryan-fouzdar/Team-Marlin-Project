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
              child: ListView.builder(
                itemCount: 10, // Placeholder for the number of meals
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.fastfood, color: Colors.white), // Placeholder icon
                    title: Text(
                      'Meal ${index + 1}',
                      style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
                    ), // Placeholder title
                    subtitle: const Text(
                      'Meal description...',
                      style: TextStyle(color: Colors.white70, fontFamily: 'Roboto'),
                    ), // Placeholder subtitle
                    onTap: () {
                      showMealDetails(context, index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }

  void showMealDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Meal Details',
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          ), // Title of the dialog
          content: SingleChildScrollView(
            // Use SingleChildScrollView to allow scrolling inside the dialog
            child: ListBody(
              children: <Widget>[
                Text('Meal Name: Meal ${index + 1}', style: TextStyle(fontFamily: 'Roboto')),
                Text('Description: This is a delicious meal...', style: TextStyle(fontFamily: 'Roboto')),
                Text('Restaurant: Local Eatery', style: TextStyle(fontFamily: 'Roboto')),
                Text('Calories: 250 kcal', style: TextStyle(fontFamily: 'Roboto')),
                Text('Carbohydrates: 30g', style: TextStyle(fontFamily: 'Roboto')),
                Text('Protein: 10g', style: TextStyle(fontFamily: 'Roboto')),
                Text('Fats: 15g', style: TextStyle(fontFamily: 'Roboto')),
                // Add more nutritional info or other details as needed
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add', style: TextStyle(fontFamily: 'Roboto')),
              onPressed: () {
                // Implement what happens when the 'Add' button is clicked
                print('Meal ${index + 1} added');
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

// import 'package:flutter/material.dart';
// import 'drawer.dart';

// class MealPage extends StatefulWidget {
//   const MealPage({Key? key}) : super(key: key);

//   @override
//   MealPageState createState() => MealPageState();
// }

// class MealPageState extends State<MealPage> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Hungry?'),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search for meals...',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//               ),
//               onSubmitted: (value) {
//                 // Implement your search query logic here
                
//               },
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "Don't know what to eat? We got you.",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10, // Placeholder for the number of meals
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: const Icon(Icons.fastfood), // Placeholder icon
//                   title: Text('Meal ${index + 1}'), // Placeholder title
//                   subtitle: const Text('Meal description...'), // Placeholder subtitle
//                   onTap: () {
//                     showMealDetails(context, index);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       drawer: const AppDrawer(),
//     );
//   }

//   void showMealDetails(BuildContext context, int index) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Meal Details'), // Title of the dialog
//         content: SingleChildScrollView( // Use SingleChildScrollView to allow scrolling inside the dialog
//           child: ListBody(
//             children: <Widget>[
//               Text('Meal Name: Meal ${index + 1}'),
//               Text('Description: This is a delicious meal...'),
//               Text('Restaurant: Local Eatery'),
//               Text('Calories: 250 kcal'),
//               Text('Carbohydrates: 30g'),
//               Text('Protein: 10g'),
//               Text('Fats: 15g'),
//               // Add more nutritional info or other details as needed
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Add'),
//             onPressed: () {
//               // Implement what happens when the 'Add' button is clicked
//               print('Meal ${index + 1} added');
//               Navigator.of(context).pop(); // Closes the dialog
//             },
//           ),
//           TextButton(
//             child: Text('Close'),
//             onPressed: () {
//               Navigator.of(context).pop(); // Closes the dialog
//             },
//           ),
//         ],
//       );
//     },
//   );
// }



//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }
