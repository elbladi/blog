import 'package:blog/screens/blog/BlogContent.dart';
import 'package:blog/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:blog/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            color: blue,
            fontSize: 30,
          ),
        ),
        fontFamily: "Peralta",
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => LoginScreen(),
        ContentScreen: (ctx) => BlogContent(),
      },
    );
  }
}
