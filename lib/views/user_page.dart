import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to User's page ${user!.email}",
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: (() => FirebaseAuth.instance.signOut()),
              child: const Text("Log out"))
        ],
      ),
    );
  }
}
