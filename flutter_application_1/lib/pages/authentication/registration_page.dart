import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/firebase_auth_services.dart';
import 'package:flutter_application_1/pages/authentication/login_page.dart';
import 'package:flutter_application_1/pages/profile_creation/aggiebites_infopage.dart';
import '../../misc/helpers.dart';
import "package:firebase_auth/firebase_auth.dart";


class RegistrationPage extends StatefulWidget {
  @override
  const RegistrationPage({Key? key}) : super(key : key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FireBaseAuthService _auth = FireBaseAuthService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration",
          style: TextStyle(color: Color.fromARGB(255, 2, 40, 81)),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 2, 40, 81),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Form(
            key: _formKey,
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
                const SizedBox(height: 8),
                const Text(
                  "Create an account to access your personal preferences!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
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
                const SizedBox(height: 16.0),
                TextFieldContainer(
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && (_passwordController.text == _confirmPasswordController.text)) {
                      // Process data if the form is valid
                      signUp(context);
                    } else {
                      showAlertDialog(context, "Error occurred with creating your account. Please try again.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD1A30F),
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                  ),
                  child: const Text('Register'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")), // Navigate to RegistrationPage
                    );
                  },
                  child: const Text(
                    "Already have an account? Click here to log in.",
                    style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontFamily: 'Roboto'), // Set font family
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // User? user = await _auth.signUpWithEmailAndPassword(email, password);

    // if (user != null) {
    //   print("User successfully created!");
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const AggieBitesInfoPage()),
    //   );
    // } else {
    //   print("Error occurred with user creation");
    // }
    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user == null) {
        throw FirebaseAuthException(code: "null user");
      }
      print("User successfully created!");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AggieBitesInfoPage()),
      );
    } on FirebaseAuthException catch (error) {
      print(error.code);
      showAlertDialog(context, "Error occurred with signing up. Please try again.");
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

