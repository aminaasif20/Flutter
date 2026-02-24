import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class Task3 extends StatelessWidget {
  const Task3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey, // Scaffold background color

      body: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.volume_up, size: 50.0, color: const Color.fromARGB(255, 36, 16, 14)),
            Icon(Icons.bluetooth, size: 50.0, color: Colors.blueAccent),
            Icon(Icons.wifi, size: 50.0, color: const Color.fromARGB(255, 230, 231, 231)),
          ],
        ),
      )
       
    );
  }
}