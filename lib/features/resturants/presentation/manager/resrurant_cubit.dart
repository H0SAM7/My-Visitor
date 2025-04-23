import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/resturants/data/models/resturant_model/resturant_model.dart';
import 'package:my_visitor/features/resturants/data/repos/resrurant_repo_impl.dart';
import 'package:my_visitor/features/resturants/data/sources/local_data_source.dart';
import 'package:my_visitor/features/resturants/data/sources/remote_data_source.dart';

part 'resrurant_state.dart';

class RestrurantCubit extends Cubit<RestrurantState> {
  RestrurantCubit() : super(ResrurantInitial());
  Future<void> getAllResturants({String? city}) async {
    emit(ResrurantLoading());

    var result = await ResrurantRepoImpl(
      remoteDataSource: ResturantRemoteDataSourceImpl(),
      resturantsLocalDataSource: ResturantsLocalDataSourceImpl(),
    ).getResturants(city: city);

    result.fold((failure) {
      log(failure.errMessage.toString());
        emit(ResrurantFailure(errMessage: failure.errMessage.toString()));
    }, (resturants) {
      log('@@@@@@@@@@@@@@@@@@@@${resturants.toString()}');

      emit(ResrurantSuccess(restaurants: resturants));
    });
  }
}
