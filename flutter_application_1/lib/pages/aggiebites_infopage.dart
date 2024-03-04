import 'package:flutter/material.dart';

class AggieBitesInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aggie Bites Info Page'),
          backgroundColor: Colors.green,
        ),
        body: InfoForm(),
      ),
    );
  }
}

class InfoForm extends StatefulWidget {
  @override
  _InfoFormState createState() => _InfoFormState();
}

class _InfoFormState extends State<InfoForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _nutritionGoalsController = TextEditingController();
  TextEditingController _favFoodController = TextEditingController();
  TextEditingController _preferredMealsController = TextEditingController();
  TextEditingController _howDidYouHearController = TextEditingController();

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
              controller: _nutritionGoalsController,
              decoration: const InputDecoration(
                labelText: 'Nutrition Goals',
              ),
            ),
            TextFormField(
              controller: _favFoodController,
              decoration: const InputDecoration(
                labelText: 'Favorite Food',
              ),
            ),
            TextFormField(
              controller: _preferredMealsController,
              decoration: const InputDecoration(
                labelText: 'Preferred Meals',
              ),
            ),
            TextFormField(
              controller: _howDidYouHearController,
              decoration: const InputDecoration(
                labelText: 'How did you hear about us?',
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
                  print('Nutrition Goals: ${_nutritionGoalsController.text}');
                  print('Favorite Food: ${_favFoodController.text}');
                  print('Preferred Meals: ${_preferredMealsController.text}');
                  print('How did you hear about us?: ${_howDidYouHearController.text}');
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: const Text('Submit')
            ),
          ],
        ),
      ),
    );
  }
}
