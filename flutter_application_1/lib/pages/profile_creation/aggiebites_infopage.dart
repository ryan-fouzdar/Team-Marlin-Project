import 'package:flutter/material.dart';
import 'meal_selection.dart';

class AggieBitesInfoPage extends StatelessWidget {
  @override
  const AggieBitesInfoPage({Key? key}) : super(key: key);

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
        body: _InfoForm(),
      ),
    );
  }
}

class _InfoForm extends StatefulWidget {
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
              TextFieldContainer(
                child: TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    prefixIcon: Icon(Icons.person, color: Colors.black),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              TextFieldContainer(
                child: TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  decoration: const InputDecoration(
                    hintText: 'Age',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              TextFieldContainer(
                child: TextFormField(
                  controller: _dailyCalorieIntakeController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  decoration: const InputDecoration(
                    hintText: 'Daily Calorie Intake Goal (kcal)',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    prefixIcon: Icon(Icons.local_fire_department, color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFieldContainer(
                child: TextFormField(
                  controller: _dailyProteinIntakeController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  decoration: const InputDecoration(
                    hintText: 'Daily Protein Intake Goal (grams)',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    prefixIcon: Icon(Icons.fitness_center, color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFieldContainer(
                child: TextFormField(
                  controller: _dailyCarbIntakeController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  decoration: const InputDecoration(
                    hintText: 'Daily Carbohydrate Intake Goal (grams)',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    prefixIcon: Icon(Icons.bakery_dining, color: Colors.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFieldContainer(
                child: TextFormField(
                  controller: _dailyFatIntakeController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                  decoration: const InputDecoration(
                    hintText: 'Daily Fat Intake Goal (grams)',
                    hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    prefixIcon: Icon(Icons.fastfood, color: Colors.black),
                    border: InputBorder.none,
                  ),
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
                    print('Daily Calorie Intake Goal (kcal): ${_dailyCalorieIntakeController.text}');
                    print('Daily Protein Intake Goal (grams): ${_dailyProteinIntakeController.text}');
                    print('Daily Carb Intake Goal (grams): ${_dailyCarbIntakeController.text}');
                    print('Daily Fat Intake Goal (grams): ${_dailyFatIntakeController.text}');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MealSelection()), // Navigate to HomePage
                  );
                },
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


// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/firebase/firebase_auth_services.dart';
// // import 'package:flutter_application_1/pages/authentication/login_page.dart';
// // import 'package:flutter_application_1/pages/profile_creation/aggiebites_infopage.dart';
// // import '../../misc/helpers.dart';
// // import "package:firebase_auth/firebase_auth.dart";


// class RegistrationPage extends StatefulWidget {
//   @override
//   const RegistrationPage({Key? key}) : super(key : key);

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final FireBaseAuthService _auth = FireBaseAuthService();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Registration",
//           style: TextStyle(color: Color.fromARGB(255, 2, 40, 81)),
//         ),
//         backgroundColor: const Color.fromARGB(255, 2, 40, 81),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Color.fromARGB(255, 2, 40, 81),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Center(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   "Let's get started!",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   "Create an account to access your personal preferences!",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 24.0),
//                 TextFieldContainer(
//                   child: TextFormField(
//                     controller: _emailController,
//                     style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
//                     decoration: const InputDecoration(
//                       hintText: 'Email',
//                       hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
//                       prefixIcon: Icon(Icons.email, color: Colors.black),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFieldContainer(
//                   child: TextFormField(
//                     controller: _passwordController,
//                     style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       hintText: 'Password',
//                       hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
//                       prefixIcon: Icon(Icons.lock, color: Colors.black),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFieldContainer(
//                   child: TextFormField(
//                     controller: _confirmPasswordController,
//                     style: const TextStyle(color: Colors.black, fontFamily: 'Roboto'),
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       hintText: 'Confirm Password',
//                       hintStyle: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
//                       prefixIcon: Icon(Icons.lock, color: Colors.black),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate() && (_passwordController.text == _confirmPasswordController.text)) {
//                       // Process data if the form is valid
//                       signUp(context);
//                     } else {
//                       showAlertDialog(context, "Error occurred with creating your account. Please try again.");
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFD1A30F),
//                     padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
//                     textStyle: const TextStyle(fontSize: 18, fontFamily: 'Roboto'),
//                   ),
//                   child: const Text('Register'),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")), // Navigate to RegistrationPage
//                     );
//                   },
//                   child: const Text(
//                     "Already have an account? Click here to log in.",
//                     style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, fontFamily: 'Roboto'), // Set font family
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void signUp(BuildContext context) async {
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     // User? user = await _auth.signUpWithEmailAndPassword(email, password);

//     // if (user != null) {
//     //   print("User successfully created!");
//     //   Navigator.push(
//     //     context,
//     //     MaterialPageRoute(builder: (context) => const AggieBitesInfoPage()),
//     //   );
//     // } else {
//     //   print("Error occurred with user creation");
//     // }
//     try {
//       User? user = await _auth.signUpWithEmailAndPassword(email, password);
//       if (user == null) {
//         throw FirebaseAuthException(code: "null user");
//       }
//       print("User successfully created!");
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const AggieBitesInfoPage()),
//       );
//     } on FirebaseAuthException catch (error) {
//       print(error.code);
//       showAlertDialog(context, "Error occurred with signing up. Please try again.");
//     }
//   }
// }

// class TextFieldContainer extends StatelessWidget {
//   final Widget child;

//   const TextFieldContainer({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: child,
//     );
//   }
// }
