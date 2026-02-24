import 'package:flutter/material.dart';
import 'package:flutter_application_1/task2.dart';
import 'package:flutter_application_1/task3.dart';
import 'package:flutter_application_1/task4.dart';
void main() {
  // runApp(MyApp());  //task-1 ky liy
  // runApp(Task2()); 
  // runApp(Task3());
  runApp(Task4());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Custom Cards & Icons"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              // 🔹 Card 1
              Card(
                color: Colors.blue[100],
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home, size: 30, color: Colors.blue),
                      Icon(Icons.favorite, size: 40, color: Colors.red),
                      Icon(Icons.star, size: 35, color: Colors.amber),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // 🔹 Card 2
              Card(
                color: Colors.green[100],
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.person, size: 50, color: Colors.green),
                      SizedBox(height: 10),
                      Icon(Icons.email, size: 35, color: Colors.teal),
                      SizedBox(height: 10),
                      Icon(Icons.phone, size: 30, color: Colors.black),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // 🔹 Card 3
              Card(
                color: Colors.purple[100],
                elevation: 12,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.shopping_cart, size: 45, color: Colors.purple),
                      Icon(Icons.payment, size: 35, color: Colors.indigo),
                      Icon(Icons.local_offer, size: 30, color: Colors.orange),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}