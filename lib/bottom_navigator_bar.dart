import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
import 'package:my_visitor/features/chatbot/screens/chat_screen.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';
import 'package:my_visitor/features/settings/views/settings_view.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});
  static String id = 'BottomNavigator';

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeView(),
    ScanView(),
    ChatbotScreen(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: [
          Image.asset(
            Assets.iconsHome,
            color: _currentIndex == 0 ?   orangeColor : Colors.white,
            height: 35,
          ),
          Image.asset(
            Assets.iconsScanning,
            color: _currentIndex == 1 ?  orangeColor : Colors.white,
            height: 35,
          ),
          Image.asset(
            Assets.iconsChatbot,
            color: _currentIndex == 2 ?  orangeColor: Colors.white,
            height: 25,
          ),
          Image.asset(
            Assets.iconsSetting,
            color: _currentIndex == 3 ?  orangeColor : Colors.white,
            height: 35,
          ),
        ],
       color: Color(0xff1c1c1c),
        buttonBackgroundColor: Color(0xff5c3317),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}