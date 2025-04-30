import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/ML/presentation/views/scan_view.dart';
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
    HomeView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 25, 25),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Image.asset(
                Assets.iconsHome,
                color: orangeColor,
                height: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Image.asset(
                Assets.iconsScanning,
                color: orangeColor,
                height: 30,
              ),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.scanner,
                size: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.settings,
                color: orangeColor,
                size: 20,
              ),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            color: Colors.orange,
          ),
          selectedFontSize: 10,
          backgroundColor: Colors.transparent ,
          type: BottomNavigationBarType.fixed   ,
          showUnselectedLabels: false           ,
          selectedIconTheme: IconThemeData()    ,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
