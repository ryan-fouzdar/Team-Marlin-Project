import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_creation/aggiebites_infopage.dart';

class RegistrationPage extends StatefulWidget {
  @override
  const RegistrationPage({Key? key}) : super(key : key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(color: Color.fromARGB(255, 2, 40, 81)), // Set title color
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81), // Set background color
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 2, 40, 81), // Set the background color here
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Let's get started!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8), // Add space between sentences
              const Text(
                "Create an account to access your personal preferences!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0), // Add space between sentences and text fields
              const TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set hint text color and font family
                    prefixIcon: Icon(Icons.email, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Add space between email and password fields
              const TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set hint text color and font family
                    prefixIcon: Icon(Icons.lock, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              const SizedBox(height: 16.0), // Add space between password and confirm password fields
              const TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set hint text color and font family
                    prefixIcon: Icon(Icons.lock, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              const SizedBox(height: 24.0), // Add space between text fields and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AggieBitesInfoPage()), // Navigate to HomePage
                  ); // Navigate to HomePage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD1A30F), // Set button color
                  padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16), // Set button padding
                  textStyle: const TextStyle(fontSize: 18, fontFamily: 'Roboto'), // Set button text style and font family
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Add border radius
        color: Colors.white, // Set box color
      ),
      child: child,
    );
  }
}
