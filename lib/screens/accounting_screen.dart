import 'package:flutter/material.dart';

import 'subject_detail_screen.dart';

class AccountingScreen extends StatelessWidget {
  const AccountingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SubjectDetailScreen(
      subject: "Accounting",
      icon: Icons.calculate_outlined,
      color: Color(0xff6d152a),
      progress: 0.65,
      topics: ["Final accounts", "Cost accounting", "Past paper practice"],
    );
  }
}
