import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_school_app/presentation/providers/teacher/teacher_provider.dart';
import 'package:tim_school_app/presentation/widgets/profile/card_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacher = context.watch<TeacherProvider>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '${teacher.profileData?.firstName ?? ''} ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        CardProfile(
                            icon: Icons.email,
                            title: '${teacher.profileData?.email ?? ''} '),
                        const SizedBox(height: 2),
                        CardProfile(
                            icon: Icons.phone_android,
                            title: '${teacher.profileData?.cellPhone ?? ''} '),
                        const SizedBox(height: 2),
                        CardProfile(
                            icon: Icons.phone,
                            title: '${teacher.profileData?.phone ?? ''} '),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
