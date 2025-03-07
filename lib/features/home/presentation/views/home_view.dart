import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/home/presentation/views/drawer/drawer_view.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/fisrt_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(Assets.imagesHomeLogo),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer: DrawerView(),
      body: Column(
        children: [
          Expanded(child: FirstSection()),
        ],
      ),
    );
  }
}
