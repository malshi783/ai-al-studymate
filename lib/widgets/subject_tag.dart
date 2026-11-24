import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class SubjectTag extends StatelessWidget {
  const SubjectTag({required this.subject, super.key});

  final String subject;

  @override
  Widget build(BuildContext context) {
    final normalized = subject.toLowerCase();
    final color = normalized.contains('account')
        ? AppColors.accounting
        : normalized.contains('econom')
        ? AppColors.economics
        : AppColors.business;

    return Container(
      constraints: const BoxConstraints(minHeight: 30),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withValues(alpha: 0.38)),
      ),
      child: Text(
        subject,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
