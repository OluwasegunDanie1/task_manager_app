import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  final String title;
  final TextStyle textStyle;

  const CustomHeading({
    super.key,
    required this.title,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, style: textStyle);
  }
}

class CustomImage extends StatelessWidget {
  final String imagepath;
  const CustomImage({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
      height: 280,
      imagepath,
    );
  }
}
