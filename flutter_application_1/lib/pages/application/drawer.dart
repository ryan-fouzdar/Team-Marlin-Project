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
  const AppDrawer({Key? key}) : super(key: key);

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DashboardWithDrawer()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Settings',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text(
              'Meal Selection',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MealPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log Out',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(title: "Login to AggieBites!")),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Wrap the Dashboard in a Scaffold with the drawer
class DashboardWithDrawer extends StatelessWidget {
  const DashboardWithDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81), // Ensure consistent background color
      ),
      body: const Dashboard(), // Ensure this is your actual Dashboard widget
      drawer: const AppDrawer(),
    );
  }
}
