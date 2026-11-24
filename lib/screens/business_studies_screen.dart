import 'package:flutter/material.dart';

import 'subject_detail_screen.dart';

class BusinessStudiesScreen extends StatelessWidget {
  const BusinessStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SubjectDetailScreen(
      subject: "Business Studies",
      icon: Icons.business_center_outlined,
      color: Color.fromARGB(255, 94, 39, 52),
      progress: 0.48,
      topics: ["Business environment", "Marketing mix", "Human resources"],
    );
  }
}
