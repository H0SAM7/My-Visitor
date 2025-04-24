import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_title_header.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/drawer/drawer_view.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/fisrt_section.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/hotels_sec.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/resturants_home_sec.dart';
import 'package:my_visitor/features/resturants/presentation/views/resturants_view.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/home_resturants_list_view.dart';

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
        ],
      ),
    );
  }
}
