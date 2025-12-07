import 'package:flutter/material.dart';
import 'package:mytaskapp/provider/auth_provider.dart';
import 'package:mytaskapp/screens/login_screens.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_style.dart';
import '../widgets/custom_headings.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custombuttons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> handleRegister(BuildContext context) async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    try {
      await Provider.of<AuthProvider>(
        context,
        listen: false,
      ).register(emailController.text.trim(), passwordController.text.trim());

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration successful!")));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(imagepath: 'images/reg.png'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.question_mark_outlined),
                  ),
                  const SizedBox(height: 15),
                  CustomHeading(
                    title: "Create your account",
                    textStyle: AppTextStyle.medium.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    title: 'Full name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(title: 'Email', controller: emailController),
                  const SizedBox(height: 15),
                  CustomTextField(
                    title: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    title: 'Confirm password',
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    title: "Sign Up",
                    backgroundColor: AppColors.blueColor,
                    textStyle: AppTextStyle.white,
                    onPressed: () => handleRegister(context),
                  ),
                  const SizedBox(height: 15),
                  Text("Already have an account?", style: AppTextStyle.medium),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: const Text("Log in"),
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
