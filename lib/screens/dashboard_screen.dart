import 'package:flutter/material.dart';

import 'subjects_screen.dart';
import 'tasks_screen.dart';
import 'timetable_screen.dart';
import 'past_papers_screen.dart';
import 'exam_countdown_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StudyMate")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning!",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              "Let's Start Your Study Journey.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            // Today's Focus
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Today's Focus",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Mathematics", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    const Text(
                      "Complete 2 tasks Today",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Subjects
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubjectsScreen(),
                  ),
                );
              },
              child: const Text(
                "Subjects",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: const Text("Accounting"),
                subtitle: const Text("Practice Past Papers"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.business),
                title: const Text("Business Studies"),
                subtitle: const Text("Review lessons and notes"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.trending_up),
                title: const Text("Economics"),
                subtitle: const Text("Practice questions"),
              ),
            ),

            const SizedBox(height: 20),

            // Tasks
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TasksScreen()),
                );
              },
              child: const Text(
                "Tasks",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),

            // Timetable
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimetableScreen(),
                  ),
                );
              },
              child: const Text(
                "Timetable",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            //Past Papers
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PastPapersScreen(),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.menu_book, size: 30),
                  title: const Text(
                    "PastPapers",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Practice Previous Past Papers"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Exam Countdown
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExamCountdownScreen(),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.timer, size: 30),
                  title: const Text(
                    "A/L Exam Countdown",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("Check how many days are left"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),

            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  title: const Text(
                    "My Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("View your student Profile"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
