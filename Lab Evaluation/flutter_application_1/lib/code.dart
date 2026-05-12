import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  runApp(const App());
}

final List<Map<String, String>> scheduleData=[
  {
    'time': '8:00 - 9:30 AM',
    'subject': 'Flutter Development',
    'room': 'Room 201',
  },
  {
    'time': '9:30 -11:00 AM',
    'subject': 'Data Structures',
    'room': 'Room 201',
  },
  {
    'time': '11:30 - 1:00 AM',
    'subject': 'Database Systems',
    'room': 'Room 201',
  },



];
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp>  {
  bool _isDark = false;

  // Called by child widgets to flip the theme
  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'My Schedule',
      debugShowCheckedModeBanner: false,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.dark,
        ),
      ),
      home: ScheduleScreen(isDark: _isDark, onToggleTheme: _toggleTheme),
    );
  }
}

class ScheduleScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const ScheduleScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Schedule',
          style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
              tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
              onPressed: onToggleTheme,
            ),
            ],
      ),
      body: SingleChildScrollView(
        // Padding around all content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // children: [
          //   // Date header
          //   // Text(
          //   //          style: Theme.of(context).textTheme.titleMedium?.copyWith(
          //   //     color: Theme.of(context).colorScheme.primary,
          //   //     fontWeight: FontWeight.w600,
          //   //   ),
          //   ),
          //   const SizedBox(height: 16),

          //   // Build one card per entry in scheduleData
          //   ...scheduleData.asMap().entries.map((entry) {
          //     final int index = entry.key;
          //     final Map<String, String> classInfo = entry.value;
          //     return Column(
          //       children: [
          //         ScheduleCard(
          //           cardNumber: index + 1,
          //           time: classInfo['time']!,
          //           subject: classInfo['subject']!,
          //           room: classInfo['room']!,
          //         ),
          //         // Add spacing between cards (not after the last one)
          //         if (index < scheduleData.length - 1)
          //           const SizedBox(height: 12),
          //       ],
          //     );
          //   }),
          // ],
        ),
      ),
    );
       

  }
  

}
class ScheduleCard extends StatelessWidget{
  final int cardNumber;
  final String time;
  final String subject;
  final String room;
  const ScheduleCard({
    super.key,
    required this.cardNumber,
    required this.time,
    required this.subject,
    required this.room,
  });
  @override
  Widget build(BuildContext context){
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card label row
            Text(
              'Card $cardNumber',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),

            // Time slot with clock icon — highlighted in primary color
            Row(
              children: [
                const Text('⏰ ', style: TextStyle(fontSize: 18)),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Subject name
            Text(subject, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 2),

            // Room number
            Text(
              room,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
    
}
