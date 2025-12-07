import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_text_style.dart';
import 'package:mytaskapp/provider/task_provider.dart';
import 'package:mytaskapp/screens/sharedtask.dart';
import 'package:mytaskapp/widgets/custom_headings.dart';
import 'package:mytaskapp/widgets/task_card.dart';
import 'package:provider/provider.dart';

class Mytaskscreen extends StatefulWidget {
  const Mytaskscreen({super.key});

  @override
  State<Mytaskscreen> createState() => _MytaskscreenState();
}

class _MytaskscreenState extends State<Mytaskscreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    await taskProvider.fetchTasksFromFirebase();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(""),
                  CustomHeading(
                    title: "My Tasks",
                    textStyle: AppTextStyle.medium,
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Sharedtask(),
                        ),
                      );

                      _loadTasks();
                    },
                    child: const Icon(Icons.add, size: 30),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else if (taskProvider.task.isEmpty)
                const Center(child: Text("No tasks found"))
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: taskProvider.task.length,
                    itemBuilder: (context, index) {
                      final task = taskProvider.task[index];
                      return TaskCard(
                        title: task.name,
                        subtitle:
                            "Due: ${task.dueDate.toLocal().toString().split(' ')[0]} - ${task.assignedTo}",
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
