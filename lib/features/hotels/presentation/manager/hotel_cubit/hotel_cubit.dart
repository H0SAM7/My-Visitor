import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/hotels/data/repos/hotel_repo_impl.dart';
import 'package:my_visitor/features/hotels/data/sources/local/hotel_local_data_source.dart';
import 'package:my_visitor/features/hotels/data/sources/remote/hotel_remote_data_source.dart';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';
import 'package:my_visitor/features/hotels/domain/repos/hotel_repo.dart';

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
      emit(HotelfFailure(errMessage: failure.errMessage.toString()));
    }, (hotels) {
      emit(HotelSuccess(hotels: hotels));
    });
  }
}
