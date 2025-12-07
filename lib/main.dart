import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mytaskapp/provider/auth_provider.dart';
import 'package:mytaskapp/provider/task_provider.dart';
import 'package:mytaskapp/screens/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:mytaskapp/constants/app_colors.dart';
import 'package:mytaskapp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prodex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.bgColor),
      ),
      home: SplashScreen(),
    );
  }
}
