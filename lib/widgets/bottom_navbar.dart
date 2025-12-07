import 'package:flutter/material.dart';
import 'package:mytaskapp/screens/calenderscreen.dart';
import 'package:mytaskapp/screens/mytaskscreen.dart';
import 'package:mytaskapp/screens/settingscreen.dart';
import 'package:mytaskapp/screens/sharedtask.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;                               
  final screens = [
    Mytaskscreen(),
    CalendarScreen(),
    Sharedtask(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff121417),
        unselectedItemColor: Color(0xff61758A),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "My Tasks"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: "Shared Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
