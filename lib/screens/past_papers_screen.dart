import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PastPapersScreen extends StatefulWidget {
  const PastPapersScreen({super.key});

  @override
  State<PastPapersScreen> createState() => _PastPapersScreenState();
}

class _PastPapersScreenState extends State<PastPapersScreen> {
  // Stores the currently selected subject.
  String selectedSubject = "Accounting";
  String selectedYear = "2025";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Past Papers")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              "Select Subject",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Subject dropdown
            DropdownButtonFormField<String>(
              initialValue: selectedSubject,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Subject",
              ),

              // Dropdown options
              items: ["Accounting", "Business Studies", "Economics"].map((
                subject,
              ) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),

              // Runs when user selects a subject
              onChanged: (value) {
                setState(() {
                  selectedSubject = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            //year
            const Text(
              "Select Year",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            //year DropDown
            DropdownButtonFormField<String>(
              initialValue: selectedYear,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Year",
              ),
              //year options
              // Dropdown options
              items:
                  [
                    "2025",
                    "2024",
                    "2023",
                    "2022",
                    "2021",
                    "2020",
                    "2019",
                    "2018",
                    "2017",
                    "2016",
                    "2015",
                    "2014",
                    "2013",
                  ].map((year) {
                    return DropdownMenuItem<String>(
                      value: year,
                      child: Text(year),
                    );
                  }).toList(),

              // Runs when user selects a year
              onChanged: (value) {
                setState(() {
                  selectedYear = value!;
                });
              },
            ),
            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf, size: 35),

                title: Text(
                  "$selectedYear $selectedSubject",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: const Text("Past Paper"),

                trailing: ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(
                      "https://example.com/past-paper.pdf",
                    );

                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  },
                  child: const Text("Open"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
