import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            const Text(
              "Student Name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("A/L Commerce Student", style: TextStyle(fontSize: 16)),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: const Text("student@example.com"),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.school),
                title: const Text("Stream"),
                subtitle: const Text("Commerce"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
