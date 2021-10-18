import 'package:flutter/material.dart';
import 'package:animated_login/animated_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedLogin(
        loginTheme: LoginTheme(),
      ),
    );
  }
}
