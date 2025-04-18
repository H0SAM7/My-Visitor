import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          progressIndicatorBuilder: (context, url, progress) => CustomLoadingIndicator(),
        ),
      ),
    );
  }
}
