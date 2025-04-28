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
  Future<void> fetchLandmarks() async {
    emit(LandmarkLoading());

    var result = await LandmarkRepoImpl(
      landmarkLocalDataSource: LandmarkLocalDataSourceImpl(),
      landmarkRemoteDataSource: LandmarkRemoteDataSourceImpl(),
    ).featchLandmarks();

    result.fold((failure) {
      log(failure.errMessage.toString());

      emit(
          LandmarkFailure(errMessage: failure.errMessage.toString()));
    }, (landmark) {
      log('@@@@@@@@@@@@@@@@@@@@${landmark.toString()}');

      emit(LandmarkSuccess(landmarkResponse: landmark));
    });
  }
}


