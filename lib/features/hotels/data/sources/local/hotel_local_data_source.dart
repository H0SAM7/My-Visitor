
import 'package:my_visitor/features/hotels/domain/entities/hotel_entity.dart';

abstract class HotelsLocalDataSource {
  Future<List<HotelEntity>> fetchAllHotels();
}

class HotelLocalDataSourceImpl extends  HotelsLocalDataSource{
  @override
  Future<List<HotelEntity>> fetchAllHotels() async{


      return hotels;
  }
  
}