import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/core/error/dio_failures.dart';
import 'package:my_visitor/features/ML/data/models/detection_model.dart';
import 'package:my_visitor/features/ML/data/repos/Ml_repo_impl.dart';
import 'package:my_visitor/features/ML/data/source/local_model_data_source.dart';
import 'package:my_visitor/features/ML/data/source/remote_model_data_source.dart';
import 'package:my_visitor/keys/hive_keys.dart';
import 'package:my_visitor/keys/network.dart';

part 'image_detection_state.dart';

class ImageDetectionCubit extends Cubit<DetectionState> {
  ImageDetectionCubit(this._dio) : super(DetectionInitial());
  final Dio _dio;

  Future<void> uploadImage({Uint8List? imageBytes, File? imageFile}) async {
    emit(DetectionLoading());

    try {
      final formData = await _prepareFormData(imageBytes, imageFile);
      if (formData == null) {
        emit(DetectionError(
            errMessage: "No image selected , pleas upload image"));
        return;
      }

      final response = await _dio.post(mlEndPoint, data: formData);

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final detectionResult = response.data as Map<String, dynamic>;
        final int classNumber = detectionResult['classes'][0];

        log('Detection result: $detectionResult');

        emit(
          DetectionSuccess(
            classNumber: classNumber,
            result: detectionResult.toString(),
          ),
        );
      } else {
        emit(DetectionError(
            errMessage: 'Unexpected Error , please try again'));
      }
    } catch (e) {
      log('Error: $e');
      if (e is DioException) {
        emit(
          DetectionError(
            errMessage: ServerFailure.fromDioException(e).errMessage.toString(),
          ),
        );
      } else {
        emit(
          DetectionError(errMessage: 'An unexpected error occurred.'),
        );
      }
    }
  }

  Future<FormData?> _prepareFormData(
      Uint8List? imageBytes, File? imageFile) async {
    if (kIsWeb && imageBytes != null) {
      return FormData.fromMap({
        "file": MultipartFile.fromBytes(imageBytes, filename: 'upload.png'),
      });
    } else if (imageFile != null) {
      return FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'upload.png'),
      });
    }
    return null;
  }

  Future<void> addData({
    required DetectionModel detection,
    required String collectionName,
  }) async {
    final result = await MlRepoImpl(
      remoteModelDataSource: RemoteModelDataSourceImpl(),
      localModelDataSource: LocalModelDataSourceImpl(),
    ).addDataTofirebase(
      data: detection,
      collectionName: collectionName,
    );
    result.fold(
      (failure) => emit(
        GetDataFilure(
          errMessage: failure.errMessage.toString(),
        ),
      ),
      (_) => emit(
        UploadDataSuccess(),
      ),
    );
  }

  List<DetectionModel> dataList = [];
  Future<void> fetchMlData() async {
    emit(GetDataLoading());
    final result = await MlRepoImpl(
      remoteModelDataSource: RemoteModelDataSourceImpl(),
      localModelDataSource: LocalModelDataSourceImpl(),
    ).getData(collectionName: kMlData);

    result.fold(
        (failure) => emit(
              GetDataFilure(
                errMessage: failure.errMessage.toString(),
              ),
            ), (data) {
      data.addAll(dataList);
      emit(
        GetDataSuccess(data: data),
      );
    });
  }

}
