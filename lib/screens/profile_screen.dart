import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            Text(
              user?.displayName ?? "Student",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("A/L Commerce Student", style: TextStyle(fontSize: 16)),
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: Text(user?.email ?? "No email available"),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: OutlinedButton.icon(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if (!context.mounted) return;
            context.go('/welcome');
          },
          icon: const Icon(Icons.logout),
          label: const Text("Log out"),
        ),
      ),
    );
  }
}
