import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:my_visitor/core/error/firebase_failure.dart';
import 'package:my_visitor/features/ML/data/models/detection_model.dart';
import 'package:my_visitor/features/ML/data/repos/Ml_repo.dart';
import 'package:my_visitor/features/ML/data/source/local_model_data_source.dart';
import 'package:my_visitor/features/ML/data/source/remote_model_data_source.dart';
import 'package:my_visitor/keys/hive_keys.dart';

class MlRepoImpl extends MlRepo {
  final RemoteModelDataSource remoteModelDataSource;
  final LocalModelDataSource localModelDataSource;
  MlRepoImpl( {required this.remoteModelDataSource,required this.localModelDataSource,});

  @override
  Future<Either<Failure, Unit>> addDataTofirebase({
    required DetectionModel data,
    required String collectionName,
  }) async {
    try {
      await remoteModelDataSource.addDataTofirebase(
        data: data,
        collectionName: collectionName,
      );
      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(
        errMessage:
            FirebaseFailure.fromFirebaseException(e as Exception).errMessage,
      ));
    }
  }

  @override
  Future<Either<Failure, List<DetectionModel>>> getData(
      {required String collectionName}) async {
    List<DetectionModel> data = [];
    try {
      data = localModelDataSource.fetchAllData();
      if (data.isNotEmpty) {
        log('get data from hive ${data.toString()}');
        return right(data);
      }
      data = await remoteModelDataSource.getData(collectionName: kMlData,);
      return right(data);
    } catch (e) {
     log(e.toString());
     return left(FirebaseFailure(
        errMessage:
            FirebaseFailure.fromFirebaseException(e as Exception).errMessage,
      ));
    }
  }
}

