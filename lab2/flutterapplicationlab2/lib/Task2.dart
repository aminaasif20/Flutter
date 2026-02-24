import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey, // Scaffold background color

      body: Container(
        width: double.infinity,
       child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.favorite, size: 50.0, color: Colors.red),
          Icon(Icons.share, size: 50.0, color: Colors.yellow),
          Icon(Icons.thumb_up, size: 50.0, color: Colors.blue),
           
       ],) 
      )
    );
  }
}