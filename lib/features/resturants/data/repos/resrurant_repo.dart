import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resutant_model.dart';

abstract class ResrurantRepo {
   Future<Either<Failure,List<RestaurantModel>>> getResturants({String? city});
 
}