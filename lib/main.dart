import 'package:currency_converter/navigation/bottom_nav_bar.dart';
import 'package:currency_converter/pages/convert_page.dart';
import 'package:currency_converter/pages/currency_page.dart';
import 'package:currency_converter/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      home: const CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  int _currentNavIndex = 0;

  final List<Widget> _pages = [
    CurrencyPage(),
    const ConvertPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentNavIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onIndexChanged: (int index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }
}
