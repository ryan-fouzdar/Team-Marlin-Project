import 'package:flutter/material.dart';
import '../../misc/colors.dart';
import 'meal_selection.dart';

class AggieBitesInfoPage extends StatelessWidget {
  @override
  const AggieBitesInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aggie Bites Info Page',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: ucdavisBlue,
        ),
        body: _InfoForm(),
      ),
    );
  }
}

class _InfoForm extends StatefulWidget {
  @override
  _InfoFormState createState() => _InfoFormState();
}

class _InfoFormState extends State<_InfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dailyCalorieIntakeController =
      TextEditingController(); // New controller
  final TextEditingController _dailyProteinIntakeController =
      TextEditingController(); // New controller
      final TextEditingController _dailyCarbIntakeController =
      TextEditingController(); // New controller
  final TextEditingController _dailyFatIntakeController =
      TextEditingController(); // New controller

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Welcome to Aggie Bites!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _dailyCalorieIntakeController, // New TextFormField
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Daily Calorie Intake Goal (kcal)',
              ),
            ),
            TextFormField(
              controller: _dailyProteinIntakeController, // New TextFormField
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Daily Protein Intake Goal (grams)',
              ),
            ),
            TextFormField(
              controller: _dailyCarbIntakeController, // New TextFormField
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Daily Carbohydrate Intake Goal (grams)',
              ),
            ),
            TextFormField(
              controller: _dailyFatIntakeController, // New TextFormField
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Daily Fat Intake Goal (grams)',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process the data
                    // For now, print the data
                    print('Name: ${_nameController.text}');
                    print('Age: ${_ageController.text}');
                    print(
                        'Daily Calorie Intake Goal (kcal): ${_dailyCalorieIntakeController.text}');
                    print(
                        'Daily Protein Intake Goal (grams): ${_dailyProteinIntakeController.text}');
                    print(
                        'Daily Carb Intake Goal (kcal): ${_dailyCarbIntakeController.text}');
                    print(
                        'Daily Fat Intake Goal (grams): ${_dailyFatIntakeController.text}');    
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MealSelection()), // Navigate to HomePage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ucdavisBlue,
                ),
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
