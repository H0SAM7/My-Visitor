import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_visitor/constants.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/url_luncher.dart';
import 'package:my_visitor/core/widgets/confirmation_dialog.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ResturantsDetailsView extends StatelessWidget {
  const ResturantsDetailsView({super.key, required this.restaurantModel});
  static String id = 'ResturantsDetailsView';
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 320,
                  child: CustomImage(
                    borderRadius: 0,
                    image: restaurantModel.squareImgUrl ??
                        'https://th.bing.com/th/id/R.26f677899cb906831538311cac52504e?rik=s0GOw2btDQt1tQ&pid=ImgRaw&r=0',
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 16.w,
                  child: CustomBack(),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // Tabs
                    const TabBar(
                      indicatorColor: Colors.blue,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Details"),
                        Tab(text: "Reviews"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _DetailsTab(
                            restaurantModel: restaurantModel,
                          ),
                          _ReviewsTab(
                            restaurantModel: restaurantModel,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsTab extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const _DetailsTab({super.key, required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Title + Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              restaurantModel.name,
              style:
                  AppStyles.style22White(context).copyWith(color: Colors.black),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 5),
                  Text(
                    restaurantModel.averageRating.toString(),
                    style: AppStyles.style16Gray(context).copyWith(
                      color: const Color.fromARGB(164, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 16,
              color: orangeColor,
            ),
            SizedBox(width: 4),
            Text(restaurantModel.parentGeoName,
                style: TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.access_time, size: 16, color: orangeColor),
            SizedBox(width: 4),
            Text(restaurantModel.currentOpenStatusText,
                style: TextStyle(color: Colors.grey)),
          ],
        ),
        const Divider(height: 32),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              Icons.fastfood,
              color: orangeColor,
              size: 16,
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                restaurantModel.establishmentTypeAndCuisineTags?.isNotEmpty ==
                        true
                    ? restaurantModel.establishmentTypeAndCuisineTags!
                        .take(5)
                        .join(', ')
                    : '',
                style: AppStyles.style16Gray(context).copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),

        SizedBox(height: 50.h),
        CustomButton(
          title: 'Go Now',
          onTap: ()  {
            if (restaurantModel.hasMenu) {
              showCustomDialog(context,
                  title: 'Explorer',
                  content: 'Are you sure you want to open this Menu',
                  positiveButtonText: 'Ok',
                  negativeButtonText: 'Cancel', onPositivePressed: () async {
                await launchUrlMethod(
                    Uri.parse(restaurantModel.menuUrl.toString()));
              }, onNegativePressed: () {
                Navigator.pop(context);
              });
            }
          },
        ),
      ],
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const _ReviewsTab({super.key, required this.restaurantModel});

  @override
  Widget build(BuildContext context) {
    final reviews = restaurantModel.reviewSnippets?.reviewSnippetsList ?? [];

    if (reviews.isEmpty) {
      return const Center(child: Text("No reviews available."));
    }

    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Container(
          decoration: BoxDecoration(border: Border.all(width: .5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                review.reviewText ?? "",
                style: AppStyles.style18(context).copyWith(color: Colors.black),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: () async {
                  if (review.reviewUrl != null) {
                    await launchUrlMethod(Uri.parse(review.reviewUrl!));
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
