import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/widgets/custom_button.dart';
import 'package:my_visitor/features/hotels/presentation/views/book_view.dart';

class ActionsSection extends StatelessWidget {
  const ActionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: 'Destination',
            width: 170.w,
            color: Color(0xff333333),
          ),
        ),
        Expanded(
          child: CustomButton(
            title: 'Book Now',
            width: 170.w,
            onTap: () {
              Navigator.pushNamed(context, BookView.id);
            },
          ),
        ),
      ],
    );
  }
}