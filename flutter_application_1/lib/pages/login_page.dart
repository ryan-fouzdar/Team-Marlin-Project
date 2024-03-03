import 'package:flutter/material.dart';
import 'homepage.dart'; // Import your homepage or wherever you navigate after successful login
import 'registration_page.dart'; // Import your registration page

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login to AggieBites!",
          style: TextStyle(color: Color.fromARGB(255, 2, 40, 81)), // Set title color
        ),
        backgroundColor: Color.fromARGB(255, 2, 40, 81), // Set background color
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/ucdavis_logo_gold.png', // Path to your logo image asset
              width: 80, // Set width of the logo
              height: 80, // Set height of the logo
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 2, 40, 81), // Set the background color here
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome to AggieBites",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8), // Add space between "Welcome to AggieBites" and subheading
              Text(
                "Let's get started!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24), // Add space between subheading and text fields
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32), // Add horizontal margin
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Add border radius
                  color: Colors.white, // Set box color
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black), // Set font color to black
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black), // Set label color to black
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding
                    prefixIcon: Icon(Icons.person, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32), // Add horizontal margin
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Add border radius
                  color: Colors.white, // Set box color
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black), // Set font color to black
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black), // Set label color to black
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding
                    prefixIcon: Icon(Icons.lock, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              SizedBox(height: 32), // Add space between text fields and button
              Container(
                margin: EdgeInsets.only(bottom: 32), // Add bottom margin
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD1A30F), // Set button color
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16), // Set button padding
                    textStyle: TextStyle(fontSize: 18), // Set button text style
                  ),
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 16), // Add space between button and registration text
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()), // Navigate to RegistrationPage
                  );
                },
                child: Text(
                  "Not registered yet? Click here to register",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
