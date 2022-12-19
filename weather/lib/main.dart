import 'package:flutter/material.dart';
import 'package:weather/home.dart';
void main() {
  runApp(const MyApp());
}

//Task:
// 1. weather design half
// 2. weather api 
// 3. image api -> fix
// 4. search -> FIX

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

