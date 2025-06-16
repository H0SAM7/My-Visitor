import 'package:flutter/material.dart';
import 'package:my_visitor/core/utils/assets.dart';
import 'package:my_visitor/features/home/presentation/search_models/governorate_model.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/pyramid_text.dart';

class FirstSection extends StatelessWidget {
   final List<Governorate> governorates;
  const FirstSection({super.key, required this.governorates});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.imagesGizaPyramid,
            fit: BoxFit.cover,
          ),
        ),
         Padding(
          padding: EdgeInsets.only(top: height * 0.1, left: 16, right: 16),
          child: CustomSearchBar(governorates: governorates),
         ),
        Positioned(
          bottom: height * 0.06,
          left: 16,
          right: 16,
          child: PyramidText(),
        ),
      ],
    );
  }
}
