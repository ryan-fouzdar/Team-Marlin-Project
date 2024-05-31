import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/firebase_auth_services.dart';
import 'package:flutter_application_1/pages/authentication/login_page.dart';
import '../profile_creation/meal_selection.dart'; // Ensure this import points to the correct file path
import 'dashboard.dart';
import 'meal_page.dart';
import '../authentication/login_page.dart';
import "package:firebase_auth/firebase_auth.dart";

class AppDrawer extends StatelessWidget {
  final String uid;

  const AppDrawer({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 2, 40, 81),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage(uid: uid)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              // Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text(
              'Meal Selection',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () { 
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage(uid: uid)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log Out',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")));
            
            },
          ),
        ],
      ),
    );
  }
}