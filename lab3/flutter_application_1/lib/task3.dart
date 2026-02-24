import 'package:flutter/material.dart';

class Task3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile UI"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2pS70HCWJe7Oht6T4wmRGCS3zl6z17qKmcg&s",
                ),
                backgroundColor: Colors.grey[300],
              ),
            ),
          ],
        ),

        body: Center(
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blue[200],

            // Network image with fallback initials
            child: ClipOval(
              child: Image.network(
                "https://i.pravatar.cc/300",
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      "AA", // Initials fallback
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}