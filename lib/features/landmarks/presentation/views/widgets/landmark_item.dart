import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/url_luncher.dart';
import 'package:my_visitor/core/widgets/confirmation_dialog.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';

class LandmarkItem extends StatelessWidget {
  const LandmarkItem({super.key, required this.destination});
  final Destination destination;

  Future<String?> fetchImageFromPexels(String query) async {
    const String apiKey = 'b0plnjBNIGcEnba0dheG39OvpnNNaHZCat1iQJURw9070lP4GUfpaNyX';
    final url = Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=1');

    final response = await http.get(
      url,
      headers: {
        'Authorization': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final photos = data['photos'] as List<dynamic>;
      if (photos.isNotEmpty) {
        return photos[0]['src']['large'] as String;
      } else {
        return null;
      }
    } else {
      log('Failed to load image: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      final link = destination.link;
        if (link != null && link.isNotEmpty) {
          showCustomDialog(context,
              title: 'Open Link',
              content: 'Are you sure you want to open this link?',
              positiveButtonText: 'OK',
              negativeButtonText: 'cancel',
              onPositivePressed: () async {
                Navigator.of(context).pop();
              await  launchUrlMethod(Uri.parse(link));
              },
              onNegativePressed: () {
                Navigator.pop(context);
              });
        }
      },
      child: SizedBox(
       height: 300,
        child: Stack(
         children: [
           Positioned.fill(
             child: FutureBuilder<String?>(
               future: fetchImageFromPexels(destination.title ?? 'landmark'),
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return const Center(child: CustomLoadingIndicator());
                 } else if (snapshot.hasError || !snapshot.hasData) {
                  log(snapshot.error.toString());
                   return CustomImage(
                     image: destination.thumbnail ?? 'https://example.com/default_image.jpg',
                   );
                 } else {
                   return CustomImage(
                     image: snapshot.data!,
                     borderRadius: 5,
                   );
                 }
               },
             ),
           ),
           Positioned.fill(
             child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.bottomCenter,
                   end: Alignment.topCenter,
                   colors: [
                     Colors.black.withOpacity(0.7),
                     Colors.transparent,
                   ],
                 ),
               ),
             ),
           ),
           Positioned(
             left: MediaQuery.sizeOf(context).width * 0.05,
             bottom: 10.h,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   destination.title != null
                       ? (destination.title!.length > 30
                           ? '${destination.title!.substring(0, 20)}...'
                           : destination.title!)
                       : '',
                   overflow: TextOverflow.ellipsis,
                   maxLines: 1,
                   style: AppStyles.style22White(context).copyWith(fontSize: 16),
                 ),
         
                 Text(
                   destination.description != null
                       ? (destination.description!.length > 50
                           ? '${destination.description!.substring(0, 50)}...'
                           : destination.description!)
                       : '',
                   style: AppStyles.style16Gray(context),
                   maxLines: 3,
                   overflow: TextOverflow.ellipsis,
                 ),
               ],
             ),
           ),
           
         ],
                    ),
      ),
    );
  }
}
