import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/hotels/presentation/manager/hotel_cubit/hotel_cubit.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/home_hotels_list_view.dart';

class HotelsHomeView extends StatefulWidget {
  const HotelsHomeView({super.key});

  @override
  State<HotelsHomeView> createState() => _HotelsHomeViewState();
}

class _HotelsHomeViewState extends State<HotelsHomeView> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await BlocProvider.of<HotelCubit>(context).fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state is HotelLoading) {
          return  Center(
            child: LoadingWidgets.loadingCircles(),
          );
        } else if (state is HotelSuccess) {
          return HomeHotelsListView(
            hotelsList: state.hotels,
          );
        } else if (state is HotelFailure) {
          return Center(
            child: CustomErrView(errMessage:state.errMessage),
          );
        }
        return const Center(
          child: Text('Press a button to fetch hotels'),
        );
      },
    );
  }
}
