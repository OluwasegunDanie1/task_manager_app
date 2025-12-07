import 'package:flutter/material.dart';

import 'package:mytaskapp/widgets/faqdetail.dart';
import 'package:mytaskapp/widgets/settingstile.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Help & Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for common issues',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'FAQs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          
          SettingsTile(
            icon: Icons.help_outline,
            title: 'Getting Started',
            subtitle: 'Learn how to create and manage tasks',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FAQDetailScreen(
                    title: 'Getting Started',
                    content:
                        "Welcome to our task management system! To get started, first create an account or log in if you already have one. Once logged in, you can create your first task by tapping the '+' button. Fill in the task details, including a title, description, due date, and any assignees. You can also organize tasks into projects or lists for better management. Explore the 'My Tasks' section to view and manage your assigned tasks, and use the 'Calendar' to visualize your schedule. For collaborative work, the 'Shared Tasks' feature allows you to assign tasks to team members and track progress together. If you need further assistance, our support team is always ready to help!",
                  ),
                ),
              );
            },
          ),
          SettingsTile(
            icon: Icons.assignment_outlined,
            title: 'Task Assignments',
            subtitle: 'Troubleshoot issues with task assignments',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.settings_outlined,
            title: 'Account Settings',
            subtitle: 'Manage your account settings and preferences',
            onTap: () {},
          ),

          const SizedBox(height: 20),
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          SettingsTile(
            icon: Icons.support_agent_outlined,
            title: 'Contact Customer Support',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.play_circle_outline,
            title: 'View Tutorials',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
