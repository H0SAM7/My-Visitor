import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/core/widgets/custom_image.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';

class LandmarkItem extends StatelessWidget {
  const LandmarkItem(
      {super.key, required this.destination,});
  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: CustomImage(
                image: destination.thumbnail ??
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.cntraveller.in%2Fstory%2Fcan-you-name-the-11-landmarks-the-world-wants-to-see-the-most%2F&psig=AOvVaw08VksgrqihSK3lKONftQLi&ust=1745551839062000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCKDUuL3d74wDFQAAAAAdAAAAABAE"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      destination.title ?? '',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Row(
                    //   children: const [
                    //     Icon(Icons.star, color: Colors.amber, size: 18),
                    //     SizedBox(width: 4),
                    //     Text(
                    //       '4.7',
                    //       style: TextStyle(fontWeight: FontWeight.w500),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                const SizedBox(height: 4),
                // Location
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Colors.grey, size: 18),
                    SizedBox(width: 4),
                    Text(
                     destination.description ?? '',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
