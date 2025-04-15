  import 'package:hive/hive.dart';
import 'package:my_visitor/features/hotelsff/domain/entities/hotel_entity.dart';

void saveHotelDataInHive(List<HotelEntity> hotels,String kBox) {
     var box = Hive.box<HotelEntity>(kBox);
    box.addAll(hotels);
  }
