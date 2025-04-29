import 'package:flutter/material.dart';
import 'package:my_visitor/features/home/presentation/views/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryItem(
            title: '"Popular"',
            icon: Icons.whatshot,
            bgColor: Colors.amber,
            isSelected: false,
          );
        });
  }
}


