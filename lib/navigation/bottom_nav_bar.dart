import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onIndexChanged,
      indicatorColor: Colors.greenAccent,
      selectedIndex: currentIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.attach_money_rounded),
          icon: Icon(Icons.attach_money_rounded),
          label: 'Currency',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.compare_arrows_rounded),
          icon: Icon(Icons.compare_arrows_rounded),
          label: 'Converter',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
    );
  }
}
