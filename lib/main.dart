import 'package:flutter/material.dart';
import 'package:tim_school_app/config/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:tim_school_app/presentation/providers/teacher/teacher_provider.dart';
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
  Widget build(BuildContext   context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TeacherProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tim School',
        theme: AppTheme(selectedColor: 1).getTheme(),
        home: const InitScreen(),
      ),
    );
  }
}
