import 'package:flutter/material.dart';

class EconomicsScreen extends StatelessWidget {
  const EconomicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Economics")),
      body: const Center(
        child: Text(
          "Economics",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
