
import 'package:hive/hive.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';

void saveHotelDataInHive(List<HotelModel> hotels,String kBox) {
     var box = Hive.box<HotelModel>(kBox);
    
    box.addAll(hotels);
  }


