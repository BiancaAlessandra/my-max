import 'package:flutter/material.dart';
import 'package:mymax/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMax',
      home: LoginPage(),
    );
  }
}