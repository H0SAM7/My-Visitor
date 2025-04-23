import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_visitor/core/utils/animation_routes.dart';
import 'package:my_visitor/core/widgets/custom_err_view.dart';
import 'package:my_visitor/core/widgets/custom_loading_indecator.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/features/resturants/presentation/manager/resrurant_cubit.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/home_resturants_Item.dart';
import 'package:my_visitor/features/resturants/presentation/views/widgets/resturant_item.dart';

class HomeResturantsListView extends StatelessWidget {
  const HomeResturantsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestrurantCubit, RestrurantState>(
      builder: (context, state) {
        if (state is ResrurantSuccess) {
          return ListView.builder(
            itemCount: state.restaurants.length,
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
           
              return SizedBox(
                            width: 300,
              
                child: HomeResturantCard(
                  restaurantModel: state.restaurants[index],
                ),
              );
            },
          );
        } else if (state is ResrurantFailure) {
          return CustomErrView(errMessage: state.errMessage);
        } else {
          return  AnimationRoutes.loadingWidget(); 
        }
      },
    );
  }
}