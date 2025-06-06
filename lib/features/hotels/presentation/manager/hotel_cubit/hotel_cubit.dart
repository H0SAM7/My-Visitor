import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/data/repos/hotel_repo_impl.dart';
import 'package:my_visitor/features/hotels/data/sources/local/hotel_local_data_source.dart';
import 'package:my_visitor/features/hotels/data/sources/remote/hotel_remote_data_source.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  Future<void> fetchHotels({String? nextPageToken}) async {
    if (nextPageToken == null) {
      emit(HotelLoading());
    } else {
      emit(HotelPginationLoading());
    }
    // emit(HotelLoading());
    var result = await HotelRepoImpl(
      hotelRemoteDataSource: HotelRemoteDataSourceImpl(),
      hotelsLocalDataSource: HotelLocalDataSourceImpl(),
    ).featchAllhotels(nextPageToken: nextPageToken);

    result.fold((failure) {
      log(failure.errMessage.toString());
      if (nextPageToken == null) {
        emit(HotelFailure(errMessage: failure.errMessage.toString()));
      } else {
        emit(HotelPaginationFailure(errMessage: failure.errMessage.toString()));
      }
      //emit(HotelFailure(errMessage: failure.errMessage.toString()));
    }, (hotels) {
      log('@@@@@@@@@@@@@@@@@@@@${hotels.toString()}');

      emit(HotelSuccess(hotels: hotels));
    });
  }
}
