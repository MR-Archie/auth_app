// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  SignIn(this.onClickedSignUp);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.email == null) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              "Login error occured",
              style: GoogleFonts.averageSans(
                  fontWeight: FontWeight.w900, fontSize: 22),
            ),
            content: Text(
              e.code.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 200, 243, 231),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    "okay",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "L O G I N",
              style: GoogleFonts.odibeeSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.blueGrey),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 85,
          ),
          Center(
            child: Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: signIn,
                child: Text(
                  "Sign in",
                  style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text("Don't have an account ?"),
              TextButton(
                onPressed: widget.onClickedSignUp,
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
