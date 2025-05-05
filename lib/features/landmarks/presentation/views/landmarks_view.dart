import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/features/landmarks/presentation/manager/landmark_cubit/landmark_cubit.dart';
import 'package:my_visitor/features/landmarks/presentation/views/widgets/landmarks_list_view.dart';
import 'package:my_visitor/generated/l10n.dart';

class LandmarksView extends StatefulWidget {
  const LandmarksView({super.key});
  static String id = 'LandmarksView';

  @override
  State<LandmarksView> createState() => _LandmarksViewState();
}

class _LandmarksViewState extends State<LandmarksView> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await BlocProvider.of<LandmarkCubit>(context).fetchLandmarks();
  }

  List<Destination> destinations = [];
  @override
  Widget build(BuildContext context) {
                                    final s= S.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(s.Popular_Now,style: AppStyles.style22White(context),),
        leading: CustomBack(),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: BlocConsumer<LandmarkCubit, LandmarkState>(
        listener: (context, state) {
          if (state is LandmarkSuccess) {
            final landmarks =
                state.landmarkResponse.landmarkModel?.destinations;

            log('🚨 &&&&&&&&&&&&&&&&&&&&&&&&&&');
            log(landmarks.toString());
            log('🚨 &&&&&&&&&&&&&&&&&&&&&&&&&&');
            if (landmarks != null && landmarks.isNotEmpty) {
              setState(() {
                destinations.addAll(landmarks);
              });
            } else {
              log('🚨 No landmarks received or landmarks are null.');
            }
          }
          if (state is LandmarkPaginationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          if (state is LandmarkLoading) {
            return Center(
              child: LoadingWidgets.loadingCircles(),
            );
          } else if (state is LandmarkSuccess
              //  ||
              //     state is LandmarkPginationLoading ||
              //     state is LandmarkPaginationFailure
              ) {
            return Column(
              children: [
                Expanded(
                  child: LandmarksListView(
                    destinations:
                        state.landmarkResponse.landmarkModel!.destinations!,
                  ),
                )
              ],
            );
          } else if (state is LandmarkFailure) {
            return CustomErrView(errMessage: state.errMessage);
          } else {
            return const Center(
              child: Text('No Data Avaliable Now !'),
            );
          }
        },
      ),
    );
  }
}
