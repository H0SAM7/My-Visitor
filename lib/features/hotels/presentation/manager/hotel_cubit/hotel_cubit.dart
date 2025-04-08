import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());
}
