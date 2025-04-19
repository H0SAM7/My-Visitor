import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/styles/text_styles.dart';
import 'package:my_visitor/core/widgets/custom_back.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/manager/hotel_cubit/hotel_cubit.dart';
import 'package:my_visitor/features/hotels/presentation/views/widgets/hotels_list_view.dart';

class HotelsView extends StatefulWidget {
  const HotelsView({super.key});
  static String id = 'HotelsView';

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await BlocProvider.of<HotelCubit>(context).fetchHotels();
  }

  List<HotelModel> hotels = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Hotels Near You',
          style: AppStyles.style22White(context),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBack(),
        ),
      ),
      body: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {
          if (state is HotelSuccess) {
            hotels.addAll(state.hotels);
          }

          if (state is HotelPaginationFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          if (state is HotelLoading) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          } else if (state is HotelSuccess ||
              state is HotelPginationLoading ||
              state is HotelPaginationFailure) {
            return Column(
              children: [
                // SizedBox(
                //   height: 250, // Set a finite height
                //   child: HotelCard(),
                // ),
                SizedBox(height: 20),
                //   HotelCard(),
                Expanded(
                  child: HotelListView(
                    hotelsList:hotels,
                  ),
                )
              ],
            );
          } else if (state is HotelFailure) {
            return Center(
              child: Text('Error: ${state.errMessage}'),
            );
          }

          return const Center(
            child: Text('Press a button to fetch hotels'),
          );
        },
      ),
    );
  }
}
