import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  const RegistrationPage({Key? key}) : super(key : key);

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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Registration Page",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16), // Add space between title and registration form
              // Add your registration form widgets here
            ],
          ),
        ),
      ),
    );
  }
}
