import 'package:flutter/material.dart';

import 'accounting_screen.dart';
import 'business_studies_screen.dart';
import 'economics_screen.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subjects")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text("Accounting"),
              subtitle: const Text("Practice Past Papers"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountingScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.business),
              title: const Text("Business Studies"),
              subtitle: const Text("Review lessons and notes"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessStudiesScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text("Economics"),
              subtitle: const Text("Practice questions"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EconomicsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
