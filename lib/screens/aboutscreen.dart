import 'package:flutter/material.dart';

import 'package:mytaskapp/widgets/settingstile.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Version'), trailing: Text('1.2.3')),
          SettingsTile(
            icon: Icons.description_outlined,
            title: 'Terms of Service',
            trailing: (Icons.arrow_forward),
          ),
          SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            trailing: (Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
