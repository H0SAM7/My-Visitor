import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel.dart';
import 'package:hive/hive.dart';

part 'hotel_entity.g.dart';


@HiveType(typeId: 0)

class HotelEntity {
    @HiveField(0)

 final String type;
  final String name;
  final String link;
  final String propertyToken;
  final String serpapiPropertyDetailsLink;
 final double? latitude;
final double? longitude;



  final String pricePerNight;

  final List<String> images;

  final int reviews;
  final double locationRating;
  final List<String> amenities;
  final List<String> excludedAmenities;
  final List<String> essentialInfo;
  final String description;
  final String deal;
  final String dealDescription;
  final String hotelClass;
  final int extractedHotelClass;


  final bool ecoCertified;
  
}
