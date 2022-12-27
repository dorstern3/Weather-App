import 'package:flutter/material.dart';
import 'package:weather/home.dart';
void main() {
  runApp(const MyApp());
}

// Problems:
// 1. image api problem
// 2. search problem

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home(),
    );
  }
}

