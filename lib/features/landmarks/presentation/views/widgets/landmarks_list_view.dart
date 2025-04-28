import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
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
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return LandmarkItem(
                destination: destinations[index],
              );
            },
          );
        }
        else if(state is LandmarkFailure){
          return CustomErrView(errMessage: state.errMessage);
        }
        else{
          return LoadingWidgets.loadingCircles();
        }
      },
    );
  }
}
