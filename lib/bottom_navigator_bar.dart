import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
import 'package:my_visitor/features/chatbot/screens/chat_screen.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';
import 'package:my_visitor/features/settings/views/settings_view.dart';
import 'dart:async';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});
  static String id = 'BottomNavigator';

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  DateTime? _lastBackPressed;

  final List<Widget> _children = [
    HomeView(),
    ScanView(),
    ChatbotScreen(),
    SettingsView(),
  ];

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() {
        _currentIndex = 0;
      });
      return false;
    }

    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Press back again to exit')),
      );
      return false;
    }

    return true; 
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _children[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 60.0,
          items: [
            Image.asset(
              Assets.iconsHome,
              color: _currentIndex == 0 ? orangeColor : Colors.white,
              height: 35,
            ),
            Image.asset(
              Assets.iconsScanning,
              color: _currentIndex == 1 ? orangeColor : Colors.white,
              height: 35,
            ),
            Image.asset(
              Assets.iconsChatbot,
              color: _currentIndex == 2 ? orangeColor : Colors.white,
              height: 25,
            ),
            Image.asset(
              Assets.iconsSetting,
              color: _currentIndex == 3 ? orangeColor : Colors.white,
              height: 35,
            ),
          ],
          color: const Color(0xff1c1c1c),
          buttonBackgroundColor: const Color(0xff5c3317),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
