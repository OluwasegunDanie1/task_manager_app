import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final IconData? trailing;

  const SettingsTile({
    this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    super.key,
    this.trailing,
  });

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

        child: Icon(icon, color: Colors.grey[700]),
      ),
      title: Text(title),
      subtitle: subtitle != null
          ? Text(subtitle!, style: const TextStyle(color: Colors.grey))
          : null,
      trailing: trailing != null
          ? const Icon(Icons.arrow_forward_ios, size: 16)
          : null,
      onTap: onTap,
    );
  }
}
