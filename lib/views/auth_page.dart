import 'package:auth_app/widgets/sign_in.dart';
import 'package:auth_app/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool isSignin = true;

  void toggle() {
    setState(() {
      isSignin = !isSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSignin ? SignIn(toggle) : SignUp(toggle);
  }
}
