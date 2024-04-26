import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_auth/firebase_auth_services.dart';
import 'package:flutter_application_1/pages/authentication/login_page.dart';
import '../profile_creation/meal_selection.dart'; // Ensure this import points to the correct file path
import 'dashboard.dart';
import 'meal_page.dart';
import '../authentication/login_page.dart';
import "package:firebase_auth/firebase_auth.dart";

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
            child: Text('Dashboard Menu', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPage()));
            },
          ),
          ListTile(
            title: const Text('Meals'),
            onTap: () {
              Navigator.pop(context); // Close the drawer before navigating
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MealPage()));
            },
          ),
          ListTile(
            title: const Text('Log Out'),
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
