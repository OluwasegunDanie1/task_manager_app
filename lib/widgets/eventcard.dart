import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String time;

  const EventCard({required this.title, required this.time, super.key});

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

        child: const Icon(Icons.calendar_today_outlined, color: Colors.grey),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(time),
    );
  }
}
