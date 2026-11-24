import 'package:flutter/material.dart';

import 'subject_detail_screen.dart';

class EconomicsScreen extends StatelessWidget {
  const EconomicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SubjectDetailScreen(
      subject: "Economics",
      icon: Icons.trending_up,
      color: Color(0xff4a0d1c),
      progress: 0.72,
      topics: ["Market structures", "National income", "Macroeconomics"],
    );
  }
}
