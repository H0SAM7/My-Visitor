import 'dart:developer';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resutant_model.dart';
import 'package:my_visitor/keys/resturants.dart';
import 'package:my_visitor/services/api_services.dart';

abstract class ResturantRemoteDataSource {
  Future<List<RestaurantModel>> getResturants();
}

class ResturantRemoteDataSourceImpl extends ResturantRemoteDataSource {
  @override
  Future<List<RestaurantModel>> getResturants({String? city}) async {
    var data = await ApiServices().getRequest(
      endPoint: '${ResturantsKeys.endPoint}${city??''}',
    );

    log(data['data'].toString());

    List<RestaurantModel> restaurants = [];
    for (var item in data['data']['data']) {
      restaurants.add(RestaurantModel.fromJson(item));
   
    }
    log('%%%%%%%%%%%%%%%%%%');
    log(restaurants[0].restaurantsId.toString());
    log('%%%%%%%%%%%%%%%%%%${restaurants.length}');

    return restaurants;
  }
}
