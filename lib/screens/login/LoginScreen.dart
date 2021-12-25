import 'package:blog/constants.dart';
import 'package:blog/widgets/Login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: green,
        child: Center(
          child: LoginButton("Are you sure?"),
        ),
      ),
    );
  }
}
