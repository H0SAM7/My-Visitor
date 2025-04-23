import 'package:flutter/material.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/resutrant_list_view.dart';

class ResturantsView extends StatelessWidget {
  const ResturantsView({super.key});
  static String id = 'ResturantsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: ResturentsListView(),
          // ),
        ],
      ),
    );
  }
}
