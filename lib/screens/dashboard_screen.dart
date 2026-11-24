import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'exam_countdown_screen.dart';
import 'subjects_screen.dart';
import 'timetable_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Set<int> _completedTasks = {1};

  static const _navy = Color(0xff25070f);
  static const _teal = Color(0xff8f2841);
  static const _ink = Color(0xff111111);
  static const _background = Color(0xffffffff);

  void _open(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: const Text(
          'StudyMate',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SafeArea(top: false, child: _homeContent()),
    );
  }

  Widget _homeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Good evening,',
            style: TextStyle(color: _ink, fontSize: 14),
          ),
          const Text(
            'student',
            style: TextStyle(
              color: _ink,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          _welcomeBanner(),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _quickAction(
                  Icons.checklist_rounded,
                  'Study tasks',
                  () => context.go('/tasks'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _quickAction(
                  Icons.calendar_month_rounded,
                  'Timetable',
                  () => _open(const TimetableScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _quickAction(
                  Icons.description_rounded,
                  'Past papers',
                  () => context.go('/papers'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _quickAction(
                  Icons.access_time_filled_rounded,
                  'Exam countdown',
                  () => _open(const ExamCountdownScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          _sectionTitle(
            'Your subjects',
            'View all',
            () => _open(const SubjectsScreen()),
          ),
          const SizedBox(height: 10),
          ...[
            ('Accounting', Icons.bar_chart_rounded),
            ('Business Studies', Icons.business_center_rounded),
            ('Economics', Icons.show_chart_rounded),
          ].map((subject) => _subjectTile(subject.$1, subject.$2)),
        ],
      ),
    );
  }

  Widget _welcomeBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Color(0xff4a0d1c), Color(0xff8f2841)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Small steps.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  'Stronger preparation.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${_completedTasks.length} of 5 tasks completed',
                  style: TextStyle(
                    color: Colors.white.withAlpha(220),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 7),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _completedTasks.length / 5,
                    minHeight: 8,
                    backgroundColor: Colors.white.withAlpha(65),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.auto_awesome, color: Color(0xffffdce4), size: 52),
        ],
      ),
    );
  }

  Widget _quickAction(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffead5da)),
        ),
        child: Row(
          children: [
            Icon(icon, color: _teal, size: 23),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: _ink,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xff6d152a), size: 18),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, String action, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: _ink,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            action,
            style: const TextStyle(color: _teal, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _subjectTile(String name, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffead5da)),
      ),
      child: ListTile(
        dense: true,
        onTap: () {},
        leading: CircleAvatar(
          radius: 17,
          backgroundColor: const Color(0xffffe8ed),
          child: Icon(icon, color: _teal, size: 19),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: _ink,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Color(0xff6d152a)),
      ),
    );
  }
}
