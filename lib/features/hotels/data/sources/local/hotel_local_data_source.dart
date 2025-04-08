
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';

abstract class HotelsLocalDataSource {
  List<HotelEntity> fetchAllHotels();
}

class HotelLocalDataSourceImpl extends  HotelsLocalDataSource{
  @override
  List<HotelEntity> fetchAllHotels() {




  }

  
}