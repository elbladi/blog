import 'package:blog/screens/blog/BlogContent.dart';
import 'package:blog/screens/login/LoginScreen.dart';
import 'package:blog/store/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blog/constants.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'firebase_options.dart';

void main() async {
  await Redux.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Redux.store,
      child: MaterialApp(
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
      ),
    );
  }
}
