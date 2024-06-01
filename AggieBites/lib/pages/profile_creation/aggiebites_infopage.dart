import 'package:flutter/material.dart';
import 'package:AggieBites/firebase/FirestoreService.dart';
import 'meal_selection.dart';
import 'package:AggieBites/misc/helpers.dart';

class AggieBitesInfoPage extends StatelessWidget {
  final String uid;
  const AggieBitesInfoPage({Key? key, required this.uid}) : super(key: key);

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
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 2, 40, 81),
        ),
        body: _InfoForm(uid: uid),
      ),
    );
  }
}

class _InfoForm extends StatefulWidget {
  final String uid;
  const _InfoForm({Key? key, required this.uid}) : super(key: key);

  @override
  _InfoFormState createState() => _InfoFormState();
}

class _InfoFormState extends State<_InfoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dailyCalorieIntakeController = TextEditingController();
  final TextEditingController _dailyProteinIntakeController = TextEditingController();
  final TextEditingController _dailyCarbIntakeController = TextEditingController();
  final TextEditingController _dailyFatIntakeController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _dailyCalorieIntakeController.dispose();
    _dailyProteinIntakeController.dispose();
    _dailyCarbIntakeController.dispose();
    _dailyFatIntakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 2, 40, 81),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to Aggie Bites!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 20.0),
              buildTextField(_nameController, 'Name', Icons.person, validator: validateName),
              const SizedBox(height: 16.0),
              buildTextField(_ageController, 'Age', Icons.calendar_today, keyboardType: TextInputType.number, validator: validateNumber),
              const SizedBox(height: 16.0),
              buildTextField(_dailyCalorieIntakeController, 'Daily Calorie Intake Goal (kcal)', Icons.local_fire_department, keyboardType: TextInputType.number, validator: validateNumber),
              const SizedBox(height: 16.0),
              buildTextField(_dailyProteinIntakeController, 'Daily Protein Intake Goal (grams)', Icons.fitness_center, keyboardType: TextInputType.number, validator: validateNumber),
              const SizedBox(height: 16.0),
              buildTextField(_dailyCarbIntakeController, 'Daily Carbohydrate Intake Goal (grams)', Icons.bakery_dining, keyboardType: TextInputType.number, validator: validateNumber),
              const SizedBox(height: 16.0),
              buildTextField(_dailyFatIntakeController, 'Daily Fat Intake Goal (grams)', Icons.fastfood, keyboardType: TextInputType.number, validator: validateNumber),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => submitForm(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD1A30F),
                  padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText, IconData icon, {TextInputType keyboardType = TextInputType.text, String? Function(String?)? validator}) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          prefixIcon: Icon(icon, color: Colors.black),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Name can only contain alphabetical characters';
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid number';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  void submitForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await _firestoreService.addUser(widget.uid, {
          'name': _nameController.text,
          'age': int.parse(_ageController.text),
          'calorieGoal': int.parse(_dailyCalorieIntakeController.text),
          'proteinGoal': int.parse(_dailyProteinIntakeController.text),
          'carbGoal': int.parse(_dailyCarbIntakeController.text),
          'fatGoal': int.parse(_dailyFatIntakeController.text),
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MealSelection(uid: widget.uid)),
        );
      } catch (e) {
        showAlertDialog(context, "Error occurred while submitting your information. Please try again.");
      }
    }
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
