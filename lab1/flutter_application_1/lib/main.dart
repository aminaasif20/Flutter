import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App Lab - 1"),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Column(
          children: [
             Row(children: [
            SizedBox(width: 100),
            Text("Hi Me Amina")
          ],)
          ]
         
        ),
      ),
    );
  }
}
