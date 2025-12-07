import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_colors.dart';
import 'package:mytaskapp/constants/app_text_style.dart';
import 'package:mytaskapp/model/taskmodel.dart';
import 'package:mytaskapp/provider/task_provider.dart';
import 'package:mytaskapp/widgets/custom_headings.dart';
import 'package:mytaskapp/widgets/custom_textfield.dart';
import 'package:mytaskapp/widgets/custombuttons.dart';
import 'package:provider/provider.dart';

class Sharedtask extends StatefulWidget {
  const Sharedtask({super.key});

  @override
  State<Sharedtask> createState() => _SharedtaskState();
}

class _SharedtaskState extends State<Sharedtask> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _assigntoContoller = TextEditingController();
  DateTime? _dueDate;
  bool _isLoading = false;

  void pickedDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  Future<void> createTask(TaskProvider taskProvider) async {
    if (_taskNameController.text.isEmpty ||
        _assigntoContoller.text.isEmpty ||
        _dueDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final task = Taskmodel(
      name: _taskNameController.text.trim(),
      dueDate: _dueDate!,
      assignedTo: _assigntoContoller.text.trim(),
    );

    try {
      await taskProvider.addTaskToFirebase(task);
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Task added successfully")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error adding task: $e")));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 30),
                  ),
                  CustomHeading(
                    title: "New Task",
                    textStyle: AppTextStyle.medium,
                  ),
                  const Text(""),
                ],
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: _taskNameController,
                title: "Task Name",
                fillColor: const Color(0xffF0F2F5),
              ),

              const SizedBox(height: 20),

              InkWell(
                onTap: pickedDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F2F5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _dueDate == null
                        ? "Select Due Date"
                        : "Due: ${_dueDate!.toLocal().toString().split(' ')[0]}",
                    style: AppTextStyle.medium2.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: _assigntoContoller,
                title: "Assign to",
              ),

              const SizedBox(height: 200),

              _isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      title: "Create Task",
                      backgroundColor: AppColors.blueColor,
                      textStyle: AppTextStyle.white,
                      onPressed: () => createTask(taskProvider),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
