import 'package:flutter/material.dart';

class Task4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Card & ListTile Demo"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              // 🔹 First Version
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    "Amina Asif",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("23-NTU-CS-1136"),
                ),
              ),

              SizedBox(height: 20),

              // 🔹 Second Version (Different Color + Trailing Icon)
              Card(
                color: Colors.green[50],
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text(
                    "Ali Raza",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  subtitle: Text("23-NTU-CS-1101"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
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