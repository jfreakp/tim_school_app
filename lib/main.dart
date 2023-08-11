import 'package:flutter/material.dart';
import 'package:tim_school_app/config/theme/app_theme.dart';

import 'presentation/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tim School',
      theme: AppTheme(selectedColor: 1).getTheme(),
      home: const InitScreen(),
    );
  }
}