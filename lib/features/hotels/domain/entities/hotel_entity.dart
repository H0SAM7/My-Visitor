import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel.dart';
import 'package:hive/hive.dart';

part 'hotel_entity.g.dart';


@HiveType(typeId: 0)

class HotelEntity {
    @HiveField(0)

  HotelModel? hotels;


  
}
