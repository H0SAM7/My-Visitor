import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/landmarks/data/models/landmark_model.dart';
import 'package:my_visitor/features/landmarks/data/repos/landmark_repo_impl.dart';
import 'package:my_visitor/features/landmarks/data/sources/local/landmark_local_data_source.dart';
import 'package:my_visitor/features/landmarks/data/sources/remote/landmark_remote_data_source.dart';

part 'landmarks_state.dart';

class LandmarkCubit extends Cubit<LandmarkState> {
  LandmarkCubit() : super(LandmarkInitial());
  Future<void> fetchLandmarks({int? pagiNum}) async {
    if (pagiNum == 10 || pagiNum == null) {
      emit(LandmarkLoading());
    } else {
      emit(LandmarkPginationLoading());
    }

    var result = await LandmarkRepoImpl(
      landmarkLocalDataSource: LandmarkLocalDataSourceImpl(),
      landmarkRemoteDataSource: LandmarkRemoteDataSourceImpl(),
    ).featchLandmarks(
      pagiNum: pagiNum,
    );

    result.fold((failure) {
      log(failure.errMessage.toString());
      if (pagiNum == 10) {
        emit(LandmarkFailure(errMessage: failure.errMessage.toString()));
      } else {
        emit(LandmarkPaginationFailure(
            errMessage: failure.errMessage.toString()));
      }
    }, (landmark) {
      log('@@@@@@@@@@@@@@@@@@@@${landmark.toString()}');

      emit(LandmarkSuccess(landmarkResponse: landmark));
    });
  }
}
