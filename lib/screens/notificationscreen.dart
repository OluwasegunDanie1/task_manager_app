import 'package:flutter/material.dart';

import 'package:mytaskapp/widgets/notificationtile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          NotificationTile(
            title: 'Project Proposal Review',
            subtitle: 'Task assigned to you',
          ),
          NotificationTile(
            title: 'Client Meeting Preparation',
            subtitle: 'Due date approaching',
          ),
          NotificationTile(
            title: 'Marketing Campaign Launch',
            subtitle: 'Task completed',
          ),
          NotificationTile(
            title: 'Budget Allocation',
            subtitle: 'Task assigned to you',
          ),
          NotificationTile(
            title: 'Team Training Session',
            subtitle: 'Due date approaching',
          ),
          NotificationTile(title: 'Product Demo', subtitle: 'Task completed'),
        ],
      ),
    );
  }
}
