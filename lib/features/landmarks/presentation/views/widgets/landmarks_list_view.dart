import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/features/landmarks/presentation/manager/landmark_cubit/landmark_cubit.dart';
import 'package:my_visitor/features/landmarks/presentation/views/widgets/landmark_item.dart';

class LandmarksListView extends StatefulWidget {
  const LandmarksListView(
      {super.key, required this.destinations,});
  final List<Destination> destinations;
  @override
  State<LandmarksListView> createState() => _LandmarksListViewState();
}

class _LandmarksListViewState extends State<LandmarksListView> {
  late ScrollController _scrollController;
  bool hasTriggered = false; // Prevent multiple triggers
  int token = 20;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }
void _onScroll() {
  if (_scrollController.hasClients) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (!hasTriggered && currentScroll / maxScroll > 0.7) {
      hasTriggered = true;
      log('📡 Triggering request - reached 70% of scroll');
      _triggerYourRequest(); // No need to set hasTriggered = false here
    }
  }
}

  void _triggerYourRequest() async {
    if (!isLoading) {
      isLoading = true;
      token += 10; // 
      log('🚀 Request triggered with nextPageToken: $token');

      await BlocProvider.of<LandmarkCubit>(context)
          .fetchLandmarks(pagiNum: token);

      isLoading = false;
      hasTriggered = false; // Reset trigger after loading is done
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // controller: _scrollController, 

      itemCount: widget.destinations.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: LandmarkItem(
                      destination: widget.destinations[index],
                    ),
        );
      },
    );
  }
}
