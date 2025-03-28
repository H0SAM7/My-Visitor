import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel.dart';

abstract class HotelRepo {
    Future<Either<Failure, List<HotelModel>>> featchAllhotels();
    Future<Either<Failure, List<HotelModel>>> book();

}