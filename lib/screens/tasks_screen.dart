import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<String> tasks = [
    "Complete Accounting Past papers",
    "Study Business Studies",
    "Practice Economics questions",
  ];

  List<bool> completed = [false, false, false];

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Add Task"),
                    content: TextField(
                      controller: taskController,
                      decoration: const InputDecoration(
                        hintText: "Enter Your Task",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          taskController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          if (taskController.text.isNotEmpty) {
                            setState(() {
                              tasks.add(taskController.text);
                              completed.add(false);
                            });

                            taskController.clear();
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

      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: completed[index],
              onChanged: (value) {
                setState(() {
                  completed[index] = value!;
                });
              },
            ),

            title: Text(tasks[index]),

            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                  completed.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
