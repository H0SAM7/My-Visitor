import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';

abstract class LandmarkRepo {
  Future<Either<Failure, LandmarkResponse>> featchLandmarks({int? pagiNum});
}
