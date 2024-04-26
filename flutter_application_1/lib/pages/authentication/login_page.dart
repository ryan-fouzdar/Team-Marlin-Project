import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_auth/firebase_auth_services.dart';
import '../application/dashboard.dart'; // Import your homepage or wherever you navigate after successful login
import 'registration_page.dart'; // Import your registration page
import '../../misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login to AggieBites!",
          style: TextStyle(color: ucdavisBlue, fontFamily: 'Roboto'), // Set title color and font
        ),
        backgroundColor: ucdavisBlue, // Set background color
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
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ucdavisBlue, // Set the background color here
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 64.0), // Increased space between top lines and email field
                const Text(
                  "Welcome to AggieBites",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto', // Set font to Roboto
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0), // Add space between "Welcome to AggieBites" and subheading
                const Text(
                  "Let's get started!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Roboto', // Set font to Roboto
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0), // Add space between "Welcome to AggieBites" and subheading
                TextFieldContainer(
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFieldContainer(
                  child: TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data if the form is valid
                      signIn(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD1A30F),
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16.0), // Add space between button and registration text
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationPage()), // Navigate to RegistrationPage
                    );
                  },
                  child: const Text(
                    "Not registered yet? Click here to register",
                    style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontFamily: 'Roboto'), // Set font family
                  ),
                ),
              ],
            )
          )
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const SizedBox(height: 64.0), // Increased space between top lines and email field
          //     const Text(
          //       "Welcome to AggieBites",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 24.0,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Roboto', // Set font to Roboto
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //     const SizedBox(height: 16.0), // Add space between "Welcome to AggieBites" and subheading
          //     const Text(
          //       "Let's get started!",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 16.0,
          //         fontFamily: 'Roboto', // Set font to Roboto
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //     const SizedBox(height: 24.0), // Add space between subheading and text fields
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10), // Add border radius
          //         color: Colors.white, // Set box color
          //       ),
          //       child: const TextField(
          //         style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
          //         decoration: InputDecoration(
          //           labelText: 'Email',
          //           labelStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set label color and font family
          //           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding
          //           prefixIcon: Icon(Icons.person, color: Colors.black), // Add prefix icon
          //           border: InputBorder.none, // Remove border
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 16.0),
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10), // Add border radius
          //         color: Colors.white, // Set box color
          //       ),
          //       child: const TextField(
          //         style: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set font color and family
          //         obscureText: true,
          //         decoration: InputDecoration(
          //           labelText: 'Password',
          //           labelStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'), // Set label color and font family
          //           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding
          //           prefixIcon: Icon(Icons.lock, color: Colors.black), // Add prefix icon
          //           border: InputBorder.none, // Remove border
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 24.0), // Add space between text fields and button
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => const DashboardPage()), // Navigate to HomePage
          //         );
          //       },
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: ucdavisYellow, // Set button color
          //         padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16), // Set button padding
          //         textStyle: const TextStyle(fontSize: 18, fontFamily: 'Roboto'), // Set button text style and font family
          //       ),
          //       child: const Text('Login'),
          //     ),
          //     const SizedBox(height: 16.0), // Add space between button and registration text
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => const RegistrationPage()), // Navigate to RegistrationPage
          //         );
          //       },
          //       child: const Text(
          //         "Not registered yet? Click here to register",
          //         style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontFamily: 'Roboto'), // Set font family
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  void signIn(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User successfully created!");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      print("Error occurred with user creation");
    }
    // try {
    //   await _auth.signInWithEmailAndPassword(email, password);
    // } on FirebaseAuthException catch (error) {
    //   print(error.code);
    // }
  }
}
