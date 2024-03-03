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
          style: TextStyle(color: Color.fromARGB(255, 2, 40, 81), fontFamily: 'Roboto'), // Set title color and font
        ),
        backgroundColor: Color.fromARGB(255, 2, 40, 81), // Set background color
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/ucdavis_logo_gold.png', // Path to your logo image asset
              width: 40 * 1.5, // Set width of the logo 1.5 times larger
              height: 40 * 1.5, // Set height of the logo 1.5 times larger
            ),
          ),
        ],
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
              SizedBox(height: 64.0), // Increased space between top lines and email field
              Text(
                "Welcome to AggieBites",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto', // Set font to Roboto
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0), // Add space between "Welcome to AggieBites" and subheading
              Text(
                "Let's get started!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: 'Roboto', // Set font to Roboto
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0), // Add space between subheading and text fields
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Add border radius
                  color: Colors.white, // Set box color
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set label color and font family
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding
                    prefixIcon: Icon(Icons.person, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Add border radius
                  color: Colors.white, // Set box color
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set label color and font family
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding
                    prefixIcon: Icon(Icons.lock, color: Colors.black), // Add prefix icon
                    border: InputBorder.none, // Remove border
                  ),
                ),
              ),
              SizedBox(height: 24.0), // Add space between text fields and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFD1A30F), // Set button color
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 16), // Set button padding
                  textStyle: TextStyle(fontSize: 18, fontFamily: 'Roboto'), // Set button text style and font family
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 16.0), // Add space between button and registration text
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()), // Navigate to RegistrationPage
                  );
                },
                child: Text(
                  "Not registered yet? Click here to register",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontFamily: 'Roboto'), // Set font family
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
