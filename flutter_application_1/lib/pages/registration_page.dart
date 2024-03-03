import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(color: Color.fromARGB(255, 2, 40, 81)), // Set title color
        ),
        backgroundColor: Color.fromARGB(255, 2, 40, 81), // Set background color
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 2, 40, 81), // Set the background color here
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Let's get started!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Add space between sentences
              Text(
                "Create an account to access your personal preferences!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0), // Add space between sentences and text fields
              TextFieldContainer(
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
              SizedBox(height: 16.0), // Add space between email and password fields
              TextFieldContainer(
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
              SizedBox(height: 16.0), // Add space between password and confirm password fields
              TextFieldContainer(
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
              SizedBox(height: 24.0), // Add space between text fields and button
              ElevatedButton(
                onPressed: () {
                  // Handle registration logic
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD1A30F), // Set button color
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16), // Set button padding
                  textStyle: TextStyle(fontSize: 18, fontFamily: 'Roboto'), // Set button text style and font family
                ),
                child: Text('Register'),
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
