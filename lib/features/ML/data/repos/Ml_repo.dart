import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/firebase_failure.dart';
import 'package:my_visitor/features/ML/data/models/detection_model.dart';

abstract class MlRepo {
 Future<Either<Failure, Unit>> addDataTofirebase(
      {required DetectionModel data, required String collectionName});
  Future<Either<Failure, List<DetectionModel>>> getData(
      {required String collectionName});
}
