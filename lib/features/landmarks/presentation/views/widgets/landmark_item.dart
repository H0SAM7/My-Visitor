import 'dart:convert';
import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/utils/functions/url_luncher.dart';
import 'package:my_visitor/core/widgets/confirmation_dialog.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';

class LandmarkItem extends StatelessWidget {
  const LandmarkItem({
    super.key,
    required this.destination,
  });
  final Destination destination;

// Future<void> showConfirmationDialog(BuildContext context, String link) async {
//     showDialog(
//       context: context,
//       barrierDismissible: false, // User must tap a button to close the dialog
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Open Link'),
//           content: Text('Are you sure you want to open this link?'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 launchUrlMethod(Uri.parse(link));
//               },
//               child: Text('Open'),
//             ),
//           ],
//         );
//       },
//     );
//   }

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
              onPositivePressed: () async{
                Navigator.of(context).pop();
              await  launchUrlMethod(Uri.parse(link));
              },
              onNegativePressed: () {
                Navigator.pop(context);
              });
        }
      },
      child: Card(
        color: Colors.black,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            //   child: CustomImage(
            //       image: destination.thumbnail ??
            //           "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cntraveller.in%2Fstory%2Fcan-you-name-the-11-landmarks-the-world-wants-to-see-the-most%2F&psig=AOvVaw08VksgrqihSK3lKONftQLi&ust=1745551839062000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKDUuL3d74wDFQAAAAAdAAAAABAE"),
            // ),
            FutureBuilder<String?>(
              future:
                  fetchImageFromPexels(destination.title ?? 'landmark'), // 👈
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CustomLoadingIndicator());
                } else if (snapshot.hasError || !snapshot.hasData) {
                  return ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(5)),
                    child: CustomImage(
                      image: destination.thumbnail ??
                          "https://example.com/default_image.jpg",
                    ),
                  );
                } else {
                  return Expanded(
                    flex: 3,
                    child: CustomImage(
                      image: snapshot.data!,
                      borderRadius: 7,
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                destination.title != null
                    ? (destination.title!.length > 25
                        ? '${destination.title!.substring(0, 24)}...'
                        : destination.title!)
                    : '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on_outlined, color: Colors.blue, size: 18),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    destination.description ?? '',
                    //     maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

Future<String?> fetchImageFromPexels(String query) async {
  const String apiKey =
      'b0plnjBNIGcEnba0dheG39OvpnNNaHZCat1iQJURw9070lP4GUfpaNyX';
  final url =
      Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=1');

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
      return photos[0]['src']['medium']
          as String; // or 'original', 'large' etc.
    } else {
      return null;
    }
  } else {
    log('Failed to load image: ${response.statusCode}');
    return null;
  }
}
