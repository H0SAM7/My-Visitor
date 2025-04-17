


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.imageList,
    required this.size,
  });

  final List<String> imageList;
  final Size size;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
    int _currentIndex = 0; // ✅ Define _currentIndex here

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
                items: widget.imageList.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: widget.size.width,
                     
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: widget.size.height * .45,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              );
  }
}



