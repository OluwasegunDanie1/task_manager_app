import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_colors.dart';
import 'package:mytaskapp/constants/app_text_style.dart';

import 'package:mytaskapp/widgets/custom_textfield.dart';
import 'package:mytaskapp/widgets/custombuttons.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/editprofile.png'),
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
            const SizedBox(height: 50),
            Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const CustomTextField(),
            const SizedBox(height: 40),
            Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const CustomTextField(),

            SizedBox(height: 40),
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
