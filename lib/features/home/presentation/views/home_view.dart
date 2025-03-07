import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/home/presentation/views/drawer/drawer_view.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/custom_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.draw_rounded,
        //   ),
        // ),
        title: Image.asset(Assets.imagesHomeLogo),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerView(),
      body: Column(
        children: [
          CustomSearchBar(),
        ],
      ),
    );
  }
}
