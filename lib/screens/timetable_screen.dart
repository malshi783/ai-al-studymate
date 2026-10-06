import 'package:flutter/material.dart';

// Timetable screen
// We use StatefulWidget because the timetable data can change
// when the user adds, deletes, or selects a class.
class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  // Controller used to get the subject entered by the user.
  final TextEditingController subjectController = TextEditingController();

  // Stores the currently selected day.
  // Initially Monday is selected.
  String selectedDay = "Monday";

  // Stores the currently selected time.
  // Initially 8:00 AM.
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);

  // List containing all timetable classes.
  //
  // Each class is stored as a Map:
  // day     -> class day
  // time    -> class time
  // subject -> subject name
  List<Map<String, String>> classes = [
    {"day": "Monday", "time": "8.00 AM", "subject": "Accounting"},
    {"day": "Tuesday", "time": "10.00 AM", "subject": "Business Studies"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------------------------------
      // APP BAR
      // ------------------------------------------------
      appBar: AppBar(
        title: const Text("Timetable"),

        // + button
        actions: [
          IconButton(
            icon: const Icon(Icons.add),

            // When + is clicked, open Add Class dialog.
            onPressed: () {
              showDialog(
                context: context,

                builder: (context) {
                  return AlertDialog(
                    title: const Text("Add Class"),

                    // ------------------------------------------------
                    // ADD CLASS FORM
                    // ------------------------------------------------
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SUBJECT INPUT
                        TextField(
                          controller: subjectController,

                          decoration: const InputDecoration(
                            labelText: "Subject",
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ------------------------------------------------
                        // DAY DROPDOWN
                        // ------------------------------------------------
                        DropdownButtonFormField<String>(
                          value: selectedDay,

                          decoration: const InputDecoration(
                            labelText: "Day",
                            border: OutlineInputBorder(),
                          ),

                          // List of days
                          items:
                              [
                                "Monday",
                                "Tuesday",
                                "Wednesday",
                                "Thursday",
                                "Friday",
                                "Saturday",
                                "Sunday",
                              ].map((day) {
                                // Convert each day into a dropdown item.
                                return DropdownMenuItem<String>(
                                  value: day,
                                  child: Text(day),
                                );
                              }).toList(),

                          // Runs when user selects a day.
                          onChanged: (value) {
                            setState(() {
                              selectedDay = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 15),

                        // ------------------------------------------------
                        // TIME PICKER
                        // ------------------------------------------------
                        ListTile(
                          title: const Text("Time"),

                          // Display selected time.
                          subtitle: Text(selectedTime.format(context)),

                          trailing: const Icon(Icons.access_time),

                          // Open TimePicker when user taps.
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: selectedTime,
                            );

                            // If user selected a time,
                            // update selectedTime.
                            if (pickedTime != null) {
                              setState(() {
                                selectedTime = pickedTime;
                              });
                            }
                          },
                        ),
                      ],
                    ),

                    // ------------------------------------------------
                    // DIALOG BUTTONS
                    // ------------------------------------------------
                    actions: [
                      // CLOSE BUTTON
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      ),

                      // ADD BUTTON
                      ElevatedButton(
                        onPressed: () {
                          // Check that subject is not empty.
                          if (subjectController.text.isNotEmpty) {
                            // Add the new class to the list.
                            setState(() {
                              classes.add({
                                "day": selectedDay,
                                "time": selectedTime.format(context),
                                "subject": subjectController.text,
                              });
                            });

                            // Clear subject input.
                            subjectController.clear();

                            // Close dialog.
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Add"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      // ------------------------------------------------
      // BODY
      // ------------------------------------------------
      body: Column(
        children: [
          // ------------------------------------------------
          // DAY BUTTONS
          // ------------------------------------------------
          SizedBox(
            height: 60,

            child: ListView(
              scrollDirection: Axis.horizontal,

              children: [
                dayButton("Monday"),
                dayButton("Tuesday"),
                dayButton("Wednesday"),
                dayButton("Thursday"),
                dayButton("Friday"),
                dayButton("Saturday"),
                dayButton("Sunday"),
              ],
            ),
          ),

          // ------------------------------------------------
          // TIMETABLE LIST
          // ------------------------------------------------
          Expanded(
            child: Builder(
              builder: (context) {
                // Only get classes matching selectedDay.
                //
                // Example:
                // selectedDay = Monday
                //
                // Then only Monday classes are displayed.
                final filteredClasses = classes
                    .where((item) => item["day"] == selectedDay)
                    .toList();

                // Display filtered classes.
                return ListView.builder(
                  // Number of classes to display.
                  itemCount: filteredClasses.length,

                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),

                      child: ListTile(
                        // Subject name
                        title: Text(filteredClasses[index]["subject"]!),

                        // Day + time
                        subtitle: Text(
                          "${filteredClasses[index]["day"]} - "
                          "${filteredClasses[index]["time"]}",
                        ),

                        // DELETE BUTTON
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),

                          onPressed: () {
                            setState(() {
                              // Get the exact class
                              // selected for deletion.
                              final classToDelete = filteredClasses[index];

                              // Remove that class from
                              // the original classes list.
                              classes.remove(classToDelete);
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------
  // DAY BUTTON FUNCTION
  // ------------------------------------------------
  //
  // This function creates a button for each day.
  //
  // Example:
  // dayButton("Monday")
  // dayButton("Tuesday")
  //
  Widget dayButton(String day) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),

      child: ElevatedButton(
        // When the button is clicked,
        // change the selected day.
        onPressed: () {
          setState(() {
            selectedDay = day;
          });
        },

        child: Text(day),
      ),
    );
  }
}
