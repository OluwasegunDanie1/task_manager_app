import 'package:flutter/material.dart';
import 'package:mytaskapp/screens/aboutscreen.dart';
import 'package:mytaskapp/screens/helpscreen.dart';
import 'package:mytaskapp/screens/login_screens.dart';
import 'package:mytaskapp/screens/notificationscreen.dart';
import 'package:mytaskapp/screens/profilescreen.dart';

import 'package:mytaskapp/widgets/settingstile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SettingsTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfileScreen()),
              );
            },

            icon: Icons.person,

            title: 'Profile',
            subtitle: 'Manage your profile',
          ),
          const SettingsTile(
            icon: Icons.credit_card,
            title: 'Subscription',
            subtitle: 'Manage your subscription',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              "Preferences",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SettingsTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationsScreen()),
              );
            },
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Manage notification preferences',
          ),
          const SettingsTile(
            icon: Icons.color_lens,
            title: 'Theme',
            subtitle: 'Manage theme preferences',
          ),
          const SettingsTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Manage language preferences',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              "General",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SettingsTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AboutScreen()),
              );
            },
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'Learn more about the app',
          ),
          SettingsTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HelpScreen()),
              );
            },
            icon: Icons.help_outline,
            title: 'Help',
            subtitle: 'Get help and support',
          ),

          SettingsTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            icon: Icons.arrow_back,
            title: 'Log Out',
          ),
        ],
      ),
    );
  }
}
