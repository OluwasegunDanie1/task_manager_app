import 'package:flutter/material.dart';
import 'package:mytaskapp/constants/app_colors.dart';
import 'package:mytaskapp/constants/app_text_style.dart';
import 'package:mytaskapp/screens/homescreen.dart';
import 'package:mytaskapp/screens/login_screens.dart';
import 'package:mytaskapp/screens/register_screens.dart';
import 'package:mytaskapp/widgets/custom_headings.dart';
import 'package:mytaskapp/widgets/custombuttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            CustomImage(imagepath: 'images/welcomee.png'),
            SizedBox(height: 15),
            CustomHeading(
              title: 'Welcome To Prodex',
              textStyle: AppTextStyle.medium.copyWith(
                fontFamily: 'Inter',
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Organize your tasks, collborate with your\n teams, and achieve your goals.",
              style: AppTextStyle.thinblack.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomButton(
              title: "Sign Up",
              backgroundColor: AppColors.blueColor,
              textStyle: AppTextStyle.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            CustomButton(
              title: "Log In",
              backgroundColor: AppColors.greyColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              textStyle: AppTextStyle.medium2.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Text(
                "Continue as Guest",
                style: AppTextStyle.medium2.copyWith(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 100),
            Text(
              "By continuing, you agree to our Terms of Service and\n Privacy Policy",
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
