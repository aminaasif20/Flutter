import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🔹 Theme switching
      theme: isDark ? darkTheme : lightTheme,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Themes"),

          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
            ),
          ],
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 Text
              Text(
                "Hello Flutter!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: 20),

              // 🔹 Button
              ElevatedButton(onPressed: () {}, child: Text("Click Me")),

              SizedBox(height: 20),

              // 🔹 Card
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "This is a card",
                    style: Theme.of(context).textTheme.bodyLarge,
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

//
// 🔹 LIGHT THEME
//
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,

  scaffoldBackgroundColor: Colors.white,

  // 🔹 AppBar style
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),

  // 🔹 Text styles
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
  ),

  // 🔹 Button style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  ),

  cardTheme: CardThemeData(color: Colors.white),
);

//
// 🔹 DARK THEME
//
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: Colors.black,

  // 🔹 AppBar style
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
  ),

  // 🔹 Text styles
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
  ),

  // 🔹 Button style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
    ),
  ),
  cardTheme: CardThemeData(color: Colors.grey),
);