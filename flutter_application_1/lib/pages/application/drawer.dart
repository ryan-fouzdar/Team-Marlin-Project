import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/firebase_auth_services.dart';
import 'package:flutter_application_1/pages/authentication/login_page.dart';
import '../profile_creation/meal_selection.dart'; // Ensure this import points to the correct file path
import 'dashboard.dart';
import 'meal_page.dart';
import '../authentication/login_page.dart';
import 'Settings/settings.dart'; // Import the Settings page
import 'Settings/settings.dart'; // Import the Settings page
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
              color: Colors.blue,
            ),
            child: Text('Menu', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPage(uid: uid)));
            },
          ),
          ListTile(
            title: const Text('Meals'),
            onTap: () {
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage(uid: uid)));
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
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(uid: uid)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log Out',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              // Handle item 1 tap
              FirebaseAuth.instance.signOut();
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")));
            },
          ),
        ],
      ),
    );
  }
}
