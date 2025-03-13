import 'package:flutter/material.dart';

import 'package:my_visitor/features/home/presentation/views/drawer/custom_list_tile.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          // CustomListTile(
          //   icon: Icons.dark_mode,
          //   title: 'Dark Mode',
          //   trailing: Switch(
          //     value: isDark,
          //     onChanged: (value) {
          //       setState(() {
          //         isDark = value;
          //       });
          //     },
          //     inactiveTrackColor: Colors.grey[300],
          //     inactiveThumbColor: Colors.grey,
          //   ),
          //   onTap: () {
          //     // إضافة ما تود فعله عند الضغط على Dark Mode
          //   },
          // ),
          CustomDrawerListTile(
            icon: Icons.info_outline,
            title: 'Account Information',
            onTap: () {},
          ),

          CustomDrawerListTile(
            icon: Icons.notifications,
            title: 'Notification',
            onTap: () {},
          ),
          CustomDrawerListTile(
            icon: Icons.local_play,
            title: 'My Plans',
            onTap: () {
              //GoRouter.of(context).push(OrderView.id);
            },
          ),

          CustomDrawerListTile(
            icon: Icons.favorite_outline,
            title: 'Favourits',
            onTap: () {},
          ),
          CustomDrawerListTile(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),
          CustomDrawerListTile(
            icon: Icons.logout,
            title: 'Logout',
            color: const Color.fromARGB(255, 180, 32, 21),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
