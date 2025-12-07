import 'package:flutter/material.dart';
import 'package:mytaskapp/widgets/appbartile.dart';
import 'package:mytaskapp/widgets/eventcard.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarTitle(title: 'Calendar'),
        actions: [Icon(Icons.add, size: 35)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ToggleButtons(
              isSelected: const [false, false, true],
              onPressed: (_) {},
              children: const [
                Padding(padding: EdgeInsets.all(8.0), child: Text('Day')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('Week')),
                Padding(padding: EdgeInsets.all(8.0), child: Text('Month')),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              'October 22, 2024',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: const [
                EventCard(title: 'Team Meeting', time: '10:00 AM'),
                EventCard(title: 'Project Review', time: '1:00 PM'),
                EventCard(title: 'Client Call', time: '3:00 PM'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
