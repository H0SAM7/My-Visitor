import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel.dart';
import 'package:my_visitor/features/hotels/data/sources/local/hotel_local_data_source.dart';
import 'package:my_visitor/features/hotels/data/sources/remote/hotel_remote_data_source.dart';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';
import 'package:my_visitor/features/hotels/domain/repos/hotel_repo.dart';
import 'package:my_visitor/keys/hotels.dart';
import 'package:my_visitor/services/api_services.dart';

class HotelRepoImpl extends HotelRepo {
  final HotelsRemoteDataSource hotelRemoteDataSource;
  final HotelsLocalDataSource hotelsLocalDataSource;

  HotelRepoImpl(
      {required this.hotelRemoteDataSource,
      required this.hotelsLocalDataSource});
  @override
  Future<Either<Failure, List<HotelEntity>>> featchAllhotels() async {
    try {
      // var data = await ApiServices().getRequest(
      //   endPoint: hotelsBaseUrl,
      //   queryParameters: {'api_key': hotelsToken},
      // );
      // List<HotelModel> hotels = (data['properties'] as List)
      //     .map((hotel) => HotelModel.fromMap(hotel))
      //     .toList();
      // log(hotels.toString());
      // log('Get Hotels Done');
      List<HotelEntity> hotelsList = hotelsLocalDataSource.fetchAllHotels();
      if (hotelsList.isNotEmpty) {
        return right(hotelsList);
      }
      List<HotelEntity> hotels = await hotelRemoteDataSource.fetchAllHotels();
      return right(hotels);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HotelModel>>> book() {
    // TODO: implement book
    throw UnimplementedError();
  }

  // Future<Either<Failure, List<BookModel>>> featchAllbooks() async {
  //   try {
  //     var data = await ApiServices().getAllBooks(
  //         endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');

  //     List<BookModel> books = [];
  //     for (var book in data['items']) {
  //       books.add(BookModel.fromJson(book));
  //     }
  //     return right(books);
  //   } catch (e) {
  // if (e is DioException) {
  //   return left(ServerFailure.fromDioException(e));
  // }
  // return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }
}
