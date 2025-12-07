import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_colors.dart';

class AppTextStyle {
  static TextStyle medium = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle thin = TextStyle(
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static TextStyle thinblack = TextStyle(
    color: AppColors.txgColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle white = TextStyle(
    color: AppColors.bgColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static TextStyle medium2 = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}
