import 'package:blog/constants.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: green,
      child: Center(
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(blue),
            ),
            onPressed: () => Navigator.of(context).pushReplacementNamed("/"),
            child: Text(
              "Salir",
              style: TextStyle(
                color: white,
                fontSize: 32,
              ),
            )),
      ),
    );
  }
}
