import 'package:flutter/material.dart';
import '../drawer.dart'; // Ensure this import points to the correct file path

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text(
              'Change Nutrition Goals',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangeNutritionGoalsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text(
              'Change Password',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text(
              'Delete Account',
              style: TextStyle(fontFamily: 'Roboto', color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DeleteAccountPage()),
              );
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}

class ChangeNutritionGoalsPage extends StatelessWidget {
  const ChangeNutritionGoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Nutrition Goals',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      body: const Center(
        child: Text(
          'Change Nutrition Goals Page Content',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      body: const Center(
        child: Text(
          'Change Password Page Content',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delete Account',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 81),
      ),
      body: const Center(
        child: Text(
          'Delete Account Page Content',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}

