import 'package:my_visitor/features/hotels/data/models/hotel_model/property.dart';
import 'package:hive/hive.dart';

part 'hotel_entity.g.dart';


@HiveType(typeId: 0)

class HotelEntity {
    @HiveField(0)

  List<Property>? properties;


  
}
