import 'package:flutter/material.dart';
import '../drawer.dart'; // Ensure this import points to the correct file path

class SettingsPage extends StatelessWidget {
  final String uid;

  const SettingsPage({Key? key, required this.uid}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => ChangeNutritionGoalsPage(uid: uid)),
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
                MaterialPageRoute(builder: (context) => ChangePasswordPage(uid: uid)),
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
                MaterialPageRoute(builder: (context) => DeleteAccountPage(uid: uid)),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(uid: uid),
    );
  }
}

class ChangeNutritionGoalsPage extends StatelessWidget {
  final String uid;

  const ChangeNutritionGoalsPage({Key? key, required this.uid}) : super(key: key);

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
      drawer: AppDrawer(uid: uid),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  final String uid;

  const ChangePasswordPage({Key? key, required this.uid}) : super(key: key);

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
      drawer: AppDrawer(uid: uid),
    );
  }
}

class DeleteAccountPage extends StatelessWidget {
  final String uid;

  const DeleteAccountPage({Key? key, required this.uid}) : super(key: key);

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
      drawer: AppDrawer(uid: uid),
    );
  }
}

