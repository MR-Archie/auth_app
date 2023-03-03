import 'package:auth_app/views/auth_page.dart';
import 'package:auth_app/views/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {                                                                                                                                                                                                                                                                                  
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Personal  Details App",
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
          ),
        ),
      ),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return UserPage();
            } else {
              return const Authpage();
            }
          }),
    );
  }
}
