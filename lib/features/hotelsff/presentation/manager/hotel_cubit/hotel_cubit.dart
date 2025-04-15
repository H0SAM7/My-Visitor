import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/hotelsff/data/repos/hotel_repo_impl.dart';
import 'package:my_visitor/features/hotelsff/data/sources/local/hotel_local_data_source.dart';
import 'package:my_visitor/features/hotelsff/data/sources/remote/hotel_remote_data_source.dart';
import 'package:my_visitor/features/hotelsff/domain/entities/hotel_entity.dart';
import 'package:my_visitor/features/hotelsff/domain/repos/hotel_repo.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  Future<void> fetchHotels() async {
    emit(HotelLoading());
    var result = await HotelRepoImpl(
      hotelRemoteDataSource: HotelRemoteDataSourceImpl(),
      hotelsLocalDataSource: HotelLocalDataSourceImpl(),
    ).featchAllhotels();

    result.fold((failure) {
      log(failure.errMessage.toString());
      emit(HotelfFailure(errMessage: failure.errMessage.toString()));
    }, (hotels) {
      emit(HotelSuccess(hotels: hotels));
    });
  }
}
