import 'package:flutter/material.dart';
import 'package:mytaskapp/provider/auth_provider.dart';
import 'package:mytaskapp/screens/register_screens.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';
import '../widgets/custom_headings.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custombuttons.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin(BuildContext context) async {
    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).login(emailController.text.trim(), passwordController.text.trim());

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful!")));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(imagepath: 'images/login.png'),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Center(
                        child: CustomHeading(
                          title: "Log in",
                          textStyle: AppTextStyle.white.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    title: "Email",
                    fillColor: const Color(0xff293038),
                    controller: emailController,
                    textColor: Colors.white,
                    borderRadius: 16,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    title: "Password",
                    fillColor: const Color(0xff293038),
                    controller: passwordController,
                    textColor: Colors.white,
                    borderRadius: 16,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: "Log in",
                    backgroundColor: AppColors.blueColor,
                    textStyle: AppTextStyle.white,
                    onPressed: () => handleLogin(context),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      ),
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(color: Color(0xff9EABBA)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
