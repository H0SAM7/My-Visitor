
// import 'package:flutter/material.dart';

// class BottomNavigator extends StatefulWidget {
//   const BottomNavigator({super.key});
//   static String id = 'BottomNavigator';

//   @override
//   State<BottomNavigator> createState() => _BottomNavigatorState();
// }

// class _BottomNavigatorState extends State<BottomNavigator> {
//   int _currentIndex = 0;

//   final List<Widget> _children = [
//     // HomeView(),
//     // HomeView(),
//     // NewOrderView(),
//     // OrdersView(),
//     // ProfileView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         onTap: onTabTapped,
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               Assets.iconsHome,
//               color: orangeColor,
//               height: 20,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               Assets.iconsCar,
//               color: orangeColor,
//               height: 20,
//             ),
//             label: 'My Order',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(Assets.iconsPlusIcon),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             // icon: Image.asset(
//             //   Assets.o,
//             //   color:  orangeColor,
//             //   height: 20,
//             // ),
//             icon:
//              Icon(
//               Icons.shopping_cart_checkout,
//               color: orangeColor,
//             ),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               Assets.iconsUser,
//               color: orangeColor,
//               height: 20,
//             ),
//             label: 'Profile',
//           ),
//         ],
//         selectedItemColor: orangeColor,
//         selectedLabelStyle: TextStyle(color: orangeColor),
//         selectedFontSize: 10,
//         showUnselectedLabels: false,
//       ),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }
