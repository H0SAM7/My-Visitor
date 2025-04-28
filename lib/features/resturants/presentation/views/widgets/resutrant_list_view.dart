import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/core/widgets/loading_widgets.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/features/resturants/presentation/manager/resrurant_cubit.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/home_resturants_Item.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/resturant_item.dart';

class ResturentsListView extends StatelessWidget {
  const ResturentsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  
    return BlocBuilder<RestrurantCubit, RestrurantState>(
      builder: (context, state) {
        if (state is ResrurantSuccess) {
          return ListView.builder(
            itemCount: state.restaurants.length,
            itemBuilder: (context, index) {

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResturantItem(
                  restaurantModel: state.restaurants[index],
                ),
              );
            },
          );
        } else if (state is ResrurantFailure) {
          return  Center(
            child: CustomErrView(errMessage:  state.errMessage),
          ); 
        } else {
          return  LoadingWidgets.loadingCircles(); 
        }
      },
    );
  }
}