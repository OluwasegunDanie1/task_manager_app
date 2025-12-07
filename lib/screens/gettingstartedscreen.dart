import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_text_style.dart';
import 'package:mytaskapp/widgets/custom_headings.dart';

class Gettingstartedscreen extends StatelessWidget {
  const Gettingstartedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back),
              CustomHeading(
                title: "Getting Started",
                textStyle: AppTextStyle.thinblack,
              ),
            ],
          ),
          Text(
            "Welcome to our task management system! To\n get started, first create an account or log in if \nyou already have one. Once logged in, you can\n create your first task by tapping the '+' button.\n Fill in the task details, including a title, description, due date, and any assignees. You\n can also organize tasks into projects or lists for\n better management. Explore the 'My Tasks' \nsection to view and manage your assigned\n tasks, and use the 'Calendar' to visualize your \nschedule. For collaborative work, the 'Shared \nTasks' feature allows you to assign tasks to \nteam members and track progress together. If\n you need further assistance, our support team\n is always ready to help!",
          ),
        ],
      ),
    );
  }
}
