import 'package:flutter/material.dart';
import 'package:AggieBites/firebase/firebase_auth_services.dart';
import 'package:AggieBites/firebase/FirestoreService.dart';
import 'package:AggieBites/pages/authentication/login_page.dart';
import 'package:AggieBites/pages/profile_creation/aggiebites_infopage.dart';
import '../../misc/helpers.dart';
import "package:firebase_auth/firebase_auth.dart";

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final FireBaseAuthService _auth = FireBaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();

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
                buildTextField(_emailController, 'Email', Icons.email),
                const SizedBox(height: 16.0),
                buildTextField(_passwordController, 'Password', Icons.lock, obscureText: true),
                const SizedBox(height: 16.0),
                buildTextField(_confirmPasswordController, 'Confirm Password', Icons.lock, obscureText: true),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => registerUser(context),
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
                      MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")),
                    );
                  },
                  child: const Text(
                    "Already have an account? Click here to log in.",
                    style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontFamily: 'Roboto'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText, IconData icon, {bool obscureText = false}) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
          prefixIcon: Icon(icon, color: Colors.black),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hintText';
          }
          return null;
        },
      ),
    );
  }

  void registerUser(BuildContext context) async {
    if (_formKey.currentState!.validate() && _passwordController.text == _confirmPasswordController.text) {
      try {
        User? user = await _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
        if (user == null) {
          throw FirebaseAuthException(code: "null user");
        }
        await _firestoreService.addUser(user.uid, {
          'email': _emailController.text,
          'uid': user.uid,
          'password': _passwordController.text,
        });
        print("User successfully created!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AggieBitesInfoPage(uid: user.uid)),
        );
      } on FirebaseAuthException catch (error) {
        print(error.code);
        showAlertDialog(context, "Error occurred with signing up. Please try again.");
      }
    } else {
      showAlertDialog(context, "Passwords do not match. Please try again.");
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
