
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_visitor/features/home/presentation/views/home_view.dart';

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
   
            HomeView(),
     HomeView(),

    // HomeView(),
    // NewOrderView(),
    // OrdersView(),
    // ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // Image.asset(
            //   Assets.iconsHome,
            //   color: orangeColor,
            //   height: 20,
            // ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // Image.asset(
            //   Assets.iconsCar,
            //   color: orangeColor,
            //   height: 20,
            // ),
            label: 'Scan',
       
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.scanner),
            
            ///Image.asset(Assets.iconsPlusIcon),
            label: '',
          ),
 
         
        ],
        selectedItemColor: Colors.orange,
        selectedLabelStyle: TextStyle(color: Colors.orange,),
        selectedFontSize: 10,
        showUnselectedLabels: false,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
