import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/hotelsff/domain/entities/hotel_entity.dart';

abstract class HotelRepo {
    Future<Either<Failure, List<HotelEntity>>> featchAllhotels();
    Future<Either<Failure, List<HotelEntity>>> book();

}