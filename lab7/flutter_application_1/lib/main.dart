import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Phase 1 variables
  Color boxColor = Colors.blue;
  double borderRadius = 0;

  // Phase 2 & 3 variables
  double value = 50;
  double red = 0, green = 0, blue = 0;
  double boxSize = 150;

  // Random color generator
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // Convert RGB to HEX
  String getHexColor() {
    return '#${red.toInt().toRadixString(16).padLeft(2, '0')}'
           '${green.toInt().toRadixString(16).padLeft(2, '0')}'
           '${blue.toInt().toRadixString(16).padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Mini App")),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🌟 Phase 1: GestureDetector
            GestureDetector(
              onTap: () {
                setState(() {
                  boxColor = getRandomColor();
                });
              },
              onDoubleTap: () {
                setState(() {
                  borderRadius = borderRadius == 0 ? 50 : 0;
                });
              },
              onLongPress: () {
                setState(() {
                  boxColor = Colors.blue;
                  borderRadius = 0;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Resetting...")),
                );
              },

              // Horizontal Drag
              onHorizontalDragUpdate: (details) {
                setState(() {
                  boxSize += details.delta.dx;
                  if (boxSize < 50) boxSize = 50;
                  if (boxSize > 300) boxSize = 300;
                });
              },

              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),

            SizedBox(height: 20),

            // 🌟 Phase 2: Slider
            Text("Value: ${value.toStringAsFixed(1)}"),

            Slider(
              min: 0,
              max: 100,
              divisions: 10,
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),

            // Cupertino Slider
            CupertinoSlider(
              min: 0,
              max: 100,
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),

            SizedBox(height: 20),

            // 🌟 Phase 3: RGB Mixer
            Text("RGB Color Mixer"),

            Slider(
              min: 0,
              max: 255,
              value: red,
              onChanged: (val) {
                setState(() {
                  red = val;
                });
              },
            ),

            Slider(
              min: 0,
              max: 255,
              value: green,
              onChanged: (val) {
                setState(() {
                  green = val;
                });
              },
            ),

            Slider(
              min: 0,
              max: 255,
              value: blue,
              onChanged: (val) {
                setState(() {
                  blue = val;
                });
              },
            ),

            GestureDetector(
              onLongPress: () {
                print("HEX: ${getHexColor()}");
              },
              child: Container(
                width: 150,
                height: 150,
                color: Color.fromARGB(255, red.toInt(), green.toInt(), blue.toInt()),
                child: Center(
                  child: Text(
                    getHexColor(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}