import 'package:flutter/material.dart';
import 'package:mytaskapp/screens/changepasswordscreen.dart';
import 'package:mytaskapp/screens/editprofilescreen.dart';

import 'package:mytaskapp/widgets/settingstile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EditProfile()),
                );
              },
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/ppp.png'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Sophia Carter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(child: Text('sophia.carter@gmail.com')),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SettingsTile(
            trailing: Icons.arrow_forward,
            title: 'Change Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChangePassword()),
              );
            },
          ),
          const SettingsTile(
            trailing: Icons.arrow_forward,
            title: 'Notifications',
          ),
          const SettingsTile(
            trailing: Icons.language,
            title: 'Language',
            subtitle: 'English',
          ),
          const SettingsTile(
            trailing: Icons.color_lens_outlined,
            title: 'Theme',
            subtitle: 'Light',
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              "Support",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const SizedBox(height: 20),
          const SettingsTile(
            trailing: Icons.arrow_forward,
            title: 'Help Center',
          ),
          const SettingsTile(
            trailing: Icons.arrow_forward,
            title: 'Contact Us',
          ),
        ],
      ),
    );
  }
}
