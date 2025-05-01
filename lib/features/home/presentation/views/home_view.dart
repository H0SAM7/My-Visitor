import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/drawer/custom_drawer.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/fisrt_section.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/hotels_sec.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/landmarks_home_sec.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/resturants_home_sec.dart';

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
        // actions: [
        //   CircleAvatar(
        //     backgroundColor: Colors.white,
        //     child: Icon(Icons.person, color: Colors.black),
        //   ),
        //   SizedBox(width: 10),
        // ],
    
      ),
      extendBodyBehindAppBar: true,
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 450.h,
              child: FirstSection(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.h),
          ),
          SliverToBoxAdapter(
            child: HomeHotelsSection(),
          ),
          SliverToBoxAdapter(
            child: ResturantsHomeSec(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverToBoxAdapter(
            child: LandmarksHomeSec(),
          ),
        ],
      ),
    );
  }
}
