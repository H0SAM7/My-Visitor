import 'package:hive/hive.dart';
import 'package:my_visitor/features/hotelsff/data/models/hotel_model/hotel_model.dart';

part 'hotel_entity.g.dart';

@HiveType(typeId: 0)
class HotelEntity {
@HiveField(0)
final  List<Properties>?properties;

  HotelEntity({required this.properties});

}


























// @HiveType(typeId: 0)
// class HotelEntity {
// @HiveField(0)
//   final String type;

//   @HiveField(1)
//   final String name;

//   @HiveField(2)
//   final String link;

//   @HiveField(3)
//   final String propertyToken;

//   @HiveField(4)
//   final String serpapiPropertyDetailsLink;

//   @HiveField(5)
//   final double latitude;

//   @HiveField(6)
//   final double longitude;

//   @HiveField(7)
//   final String pricePerNight;

//   @HiveField(8)
//   final List<String> images;

//   @HiveField(9)
//   final int reviews;

//   @HiveField(10)
//   final double locationRating;

//   @HiveField(11)
//   final List<String> amenities;

//   @HiveField(12)
//   final List<String> excludedAmenities;

//   @HiveField(13)
//   final List<String> essentialInfo;

//   @HiveField(14)
//   final String description;

//   @HiveField(15)
//   final String deal;

//   @HiveField(16)
//   final String dealDescription;

//   @HiveField(17)
//   final String hotelClass;

//   @HiveField(18)
//   final int extractedHotelClass;

//   @HiveField(19)
//   final bool ecoCertified;

// HotelEntity(
//     this.type,
//     this.name,
//     this.link,
//     this.propertyToken,
//     this.serpapiPropertyDetailsLink,
//     this.latitude,
//     this.longitude,
//     this.pricePerNight,
//     this.images,
//     this.reviews,
//     this.locationRating,
//     this.amenities,
//     this.excludedAmenities,
//     this.essentialInfo,
//     this.description,
//     this.deal,
//     this.dealDescription,
//     this.hotelClass,
//     this.extractedHotelClass,
//     this.ecoCertified,
//   );
// }    

