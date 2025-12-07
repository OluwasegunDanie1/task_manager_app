import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const TaskCard({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Color(0xffF0F2F5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(Icons.circle_outlined, color: Color(0xff121417)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontFamily: "Inter")),
    );
  }
}
