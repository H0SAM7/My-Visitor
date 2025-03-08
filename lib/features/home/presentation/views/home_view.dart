import 'package:flutter/material.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/home/presentation/views/drawer/drawer_view.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/category_item.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/category_list_view.dart';
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
          Row(
            children: [
              CategoryItem(
                title: '"Popular"',
                icon: Icons.whatshot,
                bgColor: Colors.amber,
                isSelected: true,
              ),
              CategoryItem(
                title: '"Popular"',
                icon: Icons.whatshot,
                bgColor: Colors.amber,
                isSelected: false,
              ),
            ],
          ),
          Expanded(child: SecondSection())
          //
        ],
      ),
    );
  }
}

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Expanded(child: CategoryListView(),),
        Expanded(child: LandMarkItem()),

        Expanded(child: LandMarkListView()),
      ],
    );
  }
}

class LandMarkListView extends StatelessWidget {
  const LandMarkListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LandMarkItem(),
          );
        });
  }
}

class LandMarkItem extends StatelessWidget {
  const LandMarkItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.6, // 90% of screen width
      height: screenWidth * 0.6, // 60% of screen width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(Assets.imagesLuxorTSt), // Replace with your image
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient overlay for better text visibility
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Rating badge
          Positioned(
            top: 15,
            left: 8,
            child: _infoBadge(Icons.star, '4.8', Colors.yellow),
          ),
          // Duration badge
          Positioned(
            top: 15,
            right: 8,
            child: _infoBadge(Icons.calendar_today, '3D2N', Colors.white),
          ),
          // Bottom Text Information
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Avoid excessive space
                children: [
                  Text(
                    'Luxor',
                    style: TextStyle(
                        fontSize: screenWidth * 0.03, color: Colors.brown),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Valley of the kings',
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      ),
                      Text(
                        '\$300/p',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.teal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Badge Widget for Rating and Duration
  Widget _infoBadge(IconData icon, String text, Color iconColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 14),
          SizedBox(width: 4),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 12,),),
        ],
      ),
    );
  }
}
