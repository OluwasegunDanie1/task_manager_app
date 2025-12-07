import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_colors.dart';
import 'package:mytaskapp/constants/app_text_style.dart';

import 'package:mytaskapp/widgets/custom_textfield.dart';
import 'package:mytaskapp/widgets/custombuttons.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CustomTextField(title: "Current Password"),
            SizedBox(height: 70),
            const CustomTextField(title: "New Password"),
            SizedBox(height: 70),
            const CustomTextField(title: "Confirm New Password"),
            Spacer(),
            CustomButton(
              title: "Save CHanges",
              backgroundColor: AppColors.blueColor,
              textStyle: AppTextStyle.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
