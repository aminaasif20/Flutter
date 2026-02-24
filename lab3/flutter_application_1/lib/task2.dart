import 'package:flutter/material.dart';

void main() {
  runApp(Task2());
}

class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Margin & Padding Demo"),
        ),
        body: Center(
          child: Container(
            // 🔹 External Spacing (Margin)
            margin: EdgeInsets.symmetric(
              vertical: 50.0,
              horizontal: 10.0,
            ).add(
              EdgeInsets.only(left: 10),
            ),

            // 🔹 Internal Spacing (Padding)
            padding: EdgeInsets.all(20.0),

            color: Colors.blueAccent,

            child: Text(
              "This is a Container\nwith Padding and Margin",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}