import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/landmarks/presentation/manager/landmark_cubit/landmark_cubit.dart';
import 'package:my_visitor/features/landmarks/presentation/views/widgets/landmark_item.dart';

class LandmarksListView extends StatelessWidget {
  const LandmarksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandmarkCubit, LandmarkState>(
      builder: (context, state) {
        if (state is LandmarkSuccess) {
          final destinations =
              state.landmarkResponse.landmarkModel?.destinations ?? [];
          return ListView.builder(
            itemCount: destinations.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 250.w,
                child: LandmarkItem(
                  destination: destinations[index],
                ),
              );
            },
          );
        } else if (state is LandmarkFailure) {
          return CustomErrView(errMessage: state.errMessage);
        } else {
          return LoadingWidgets.loadingCircles();
        }
      },
    );
  }
}
