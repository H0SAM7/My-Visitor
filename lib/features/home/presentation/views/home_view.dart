import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/home/presentation/search_models/data_loader.dart';
import 'package:my_visitor/features/home/presentation/search_models/governorate_model.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/custom_search_bar.dart';
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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          Assets.imagesHomeLogo,
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            Assets.iconsDrawerIcon,
            color: Colors.white,
            height: 26.h,
          ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      drawer: CustomDrawer(),

      // هنا بنبدأ نحمّل بيانات JSON
      body: FutureBuilder<List<Governorate>>(
        future: loadGovernorates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final governorates = snapshot.data!;
            print("✅ Loaded Governorates: ${governorates.length}");
            return CustomScrollView(
              slivers: [
                // ✅ السيرش بار هنا في أول الصفحة
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // child: CustomSearchBar(governorates: governorates),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 450.h,
                    child: FirstSection(governorates: governorates),
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
            );
          }
        },
      ),
    );
  }
}
