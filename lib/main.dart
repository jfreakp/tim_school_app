import 'package:flutter/material.dart';
import 'package:tim_school_app/config/theme/app_theme.dart';

import 'presentation/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tim School',
      theme: AppTheme(selectedColor: 3).getTheme(),
      home: const HomeScreen(),
    );
  }
}