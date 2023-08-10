import 'package:flutter/material.dart';

import '../../screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
