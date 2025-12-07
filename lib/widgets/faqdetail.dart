import 'package:flutter/material.dart';

class FAQDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const FAQDetailScreen({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content, style: const TextStyle(fontSize: 16, height: 1.4)),
      ),
    );
  }
}
