import 'package:flutter/material.dart';
import 'package:tourism_app/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 103, 194, 180),
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
