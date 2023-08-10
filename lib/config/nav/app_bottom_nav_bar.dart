import 'package:flutter/material.dart';
import 'package:tim_school_app/config/theme/app_theme.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: 'Home',
            backgroundColor: colors.primary),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person_sharp),
            label: 'Perfil',
            backgroundColor: colors.primary)
      ],
    );
  }
}
