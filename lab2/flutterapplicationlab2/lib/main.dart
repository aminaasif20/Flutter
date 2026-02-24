import 'package:flutter/material.dart';
import 'package:flutterapplicationlab2/Task4.dart';
// import 'package:flutterapplicationlab2/task2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // home: Task2(),
      home: Task4(),
      
    );
  }
}

class SafeContainerScreen extends StatelessWidget {
  const SafeContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Scaffold background color

      body: SafeArea(   // SafeArea wrapper
        child: Center(
          child: Container(
            width: 250,
            height: 250,

            margin: const EdgeInsets.all(25.0), // 25 margin all sides
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,   // top & bottom padding
            ),

            color: Colors.white,
            child: const Center(
              child: Text(
                "Safe Container",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}