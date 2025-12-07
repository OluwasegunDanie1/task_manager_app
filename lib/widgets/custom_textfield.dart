import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final Color fillColor;
  final Color textColor;
  final Color hintColor;
  final double borderRadius;
  final int maxLines;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.title = "",
    this.controller,
    this.fillColor = const Color(0xFFF1F3F6),
    this.textColor = Colors.black,
    this.hintColor = Colors.grey,
    this.borderRadius = 12,
    this.maxLines = 1,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: title,
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: hintColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: textColor),
    );
  }
}
