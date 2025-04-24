import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/data/sources/local/hotel_local_data_source.dart';
import 'package:my_visitor/features/hotels/data/sources/remote/hotel_remote_data_source.dart';
import 'package:my_visitor/features/hotels/domain/repos/hotel_repo.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/features/landmarks/data/repos/landmark_repo.dart';
import 'package:my_visitor/features/landmarks/data/sources/local/landmark_local_data_source.dart';
import 'package:my_visitor/features/landmarks/data/sources/remote/landmark_remote_data_source.dart';
import 'package:my_visitor/keys/hotels.dart';

class LandmarkRepoImpl extends LandmarkRepo {
  final LandmarkRemoteDataSource landmarkRemoteDataSource;
  final LandmarkLocalDataSource landmarkLocalDataSource;

  LandmarkRepoImpl({required this.landmarkRemoteDataSource, required this.landmarkLocalDataSource});

  @override
  Future<Either<Failure, LandmarkResponse>> featchLandmarks(
     ) async {

    try {


   LandmarkResponse   landmarksLocal = landmarkLocalDataSource.fetchLandmarks();
      if (landmarksLocal.shoppingResults?.isNotEmpty ??false) {
        log('get data from hive ${landmarksLocal.toString()}');
        return right(landmarksLocal);
      }
      LandmarkResponse   landmarksRemo = await landmarkRemoteDataSource.fetchLandmarks(
         );
      return right(landmarksRemo);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
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
