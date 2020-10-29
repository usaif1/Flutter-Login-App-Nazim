import 'package:flutter/material.dart';

import './Screens/login_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontWeight: FontWeight.w600,
    ),
            headline2: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),



    );
  }
}