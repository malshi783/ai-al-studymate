import 'package:flutter/material.dart';

class ExamCountdownScreen extends StatefulWidget {
  const ExamCountdownScreen({super.key});

  @override
  State<ExamCountdownScreen> createState() => _ExamCountdownScreenState();
}

class _ExamCountdownScreenState extends State<ExamCountdownScreen> {
  DateTime examDate = DateTime(2027, 8, 10);
  int daysLeft = 0;

  void calculateDaysLeft() {
    final today = DateTime.now();

    final difference = examDate.difference(today);
    setState(() {
      daysLeft = difference.inDays;
    });
  }

  @override
  void initState() {
    super.initState();
    calculateDaysLeft();
  }

  Future<void> selectExamDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: examDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        examDate = pickedDate;
      });
      calculateDaysLeft();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exam CountDown")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "A/L Exam",

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            Text(
              " $daysLeft",
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),

            const Text("Days Left", style: TextStyle(fontSize: 20)),

            const SizedBox(height: 20),

            Text(
              "Exam Date: ${examDate.day}/${examDate.month}/${examDate.year}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: selectExamDate,
              child: const Text("Select Exam Date"),
            ),
          ],
        ),
      ),
    );
  }
}
