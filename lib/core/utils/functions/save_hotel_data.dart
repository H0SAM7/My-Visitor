  import 'package:hive/hive.dart';
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';

void saveHotelDataInHive(List<HotelEntity> hotels,String kBox) {
     var box = Hive.box(kBox);
    box.addAll(hotels);
  }
