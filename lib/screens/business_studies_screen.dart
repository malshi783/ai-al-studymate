import 'package:flutter/material.dart';

class BusinessStudiesScreen extends StatelessWidget {
  const BusinessStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Business Studies")),
      body: const Center(
        child: Text(
          "Business Studies",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
