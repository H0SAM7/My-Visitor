import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/manager/hotel_cubit/hotel_cubit.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotel_card.dart';

class HotelListView extends StatefulWidget {
  const HotelListView({super.key, required this.hotelsList});
  final List<HotelModel> hotelsList;

  @override
  State<HotelListView> createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  late ScrollController _scrollController;
  bool hasTriggered = false; // Prevent multiple triggers

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
        _triggerYourRequest();
      }
    }
  }

  void _triggerYourRequest() async {
    await BlocProvider.of<HotelCubit>(context).fetchHotels();
    log('🚀 Request triggered!');
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final properties = widget.hotelsList
        .expand((hotel) => hotel.properties!)
        .toList()
        .sublist(2);

    return GridView.builder(
      controller: _scrollController,
      itemCount: properties.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth < 600 ? 2 : 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2 / 3.5,
      ),
      itemBuilder: (context, index) {
        final hotel = properties[index];
        return HotelCard(hotel: hotel);
      },
    );
  }
}
