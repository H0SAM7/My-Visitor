import 'package:flutter/material.dart';
import 'package:my_visitor/features/landmarks/presentation/views/widgets/landmarks_list_view.dart';



class LandmarksView extends StatelessWidget {
  const LandmarksView({super.key});
  static String id = 'LandmarksView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LandmarksListView(),
          )
        ],
      ),
    );
  }
}
