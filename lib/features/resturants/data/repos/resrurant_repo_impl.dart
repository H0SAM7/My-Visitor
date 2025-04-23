import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/features/resturants/data/repos/resrurant_repo.dart';
import 'package:my_visitor/features/resturants/data/sources/local_data_source.dart';
import 'package:my_visitor/features/resturants/data/sources/remote_data_source.dart';

class ResrurantRepoImpl extends ResrurantRepo {
  final ResturantRemoteDataSource remoteDataSource;
  final ResturantsLocalDataSource resturantsLocalDataSource;

  ResrurantRepoImpl(
      {required this.remoteDataSource,
      required this.resturantsLocalDataSource});
  @override
  Future<Either<Failure, List<RestaurantModel>>> getResturants({String? city})async {
    List<RestaurantModel> restaurants = [];
    try {
      restaurants = resturantsLocalDataSource.fetchAllResturants();
      if (restaurants.isNotEmpty) {
        log('get data from hive ${restaurants.toString()}');
        return right(restaurants);
      }
      restaurants = await remoteDataSource.getResturants(
          );
      return right(restaurants);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
