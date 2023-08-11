import 'package:flutter/material.dart';

import '../../screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TIM SCHOOL',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colors.secondary,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: colors.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
