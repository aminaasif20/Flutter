import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key}); //constructor

  @override
  State<ProfilePage> createState()=>_ProfilePageState(); //this method connect the widget and state
} // ProfilePage → blueprint
// _ProfilePageState → actual mutable data



class _ProfilePageState extends State<ProfilePage> {

  // Task 6: State variables
  bool isFollowed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(   // Task 1: SafeArea
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Task 3
          children: [

            // -----------------------------
            // Task 2: Header Section
            // -----------------------------
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [

                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwDuzJ8I3z1jsvbwpNMDimWZ4_h-IRiECDQ&s"),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Amina Asif",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Software Engineer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // -----------------------------
                  // Task 7: Buttons
                  // -----------------------------
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowed = !isFollowed;
                      });
                    },
                    child: Text(
                      isFollowed ? "Following" : "Follow",
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      setState(() {
                        score++;
                      });
                    },
                    icon: const Icon(Icons.favorite),
                    color: const Color.fromARGB(255, 14, 209, 231),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // -----------------------------
            // Task 4: Expanded Row (2:1 ratio)
            // -----------------------------
            Expanded(
              child: Row(
                children: [

                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.blue[200],
                      child: const Center(
                        child: Text(
                          "Main Content (2x)",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.green[200],
                      child: const Center(
                        child: Text(
                          "Side (1x)",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // -----------------------------
            // Task 8: Card with ListTile
            // -----------------------------
            Card(
              elevation: 6,
              margin: const EdgeInsets.all(20),
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.orange),
                title: const Text("Score"),
                subtitle: Text("Likes: $score"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}