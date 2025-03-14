import 'dart:convert';

import 'gps_coordinates.dart';
import 'image.dart';
import 'nearby_place.dart';
import 'price.dart';
import 'rate_per_night.dart';
import 'rating.dart';
import 'reviews_breakdown.dart';
import 'total_rate.dart';

class Property {
  String? type;
  String? name;
  String? link;
  String? propertyToken;
  String? serpapiPropertyDetailsLink;
  GpsCoordinates? gpsCoordinates;
  String? checkInTime;
  String? checkOutTime;
  RatePerNight? ratePerNight;
  TotalRate? totalRate;
  List<Price>? prices;
  List<NearbyPlace>? nearbyPlaces;
  List<Image>? images;
  double? overallRating;
  int? reviews;
  double? locationRating;
  List<String>? amenities;
  List<String>? excludedAmenities;
  List<String>? essentialInfo;
  String? description;
  String? deal;
  String? dealDescription;
  String? hotelClass;
  int? extractedHotelClass;
  List<Rating>? ratings;
  List<ReviewsBreakdown>? reviewsBreakdown;
  bool? ecoCertified;

  Property({
    this.type,
    this.name,
    this.link,
    this.propertyToken,
    this.serpapiPropertyDetailsLink,
    this.gpsCoordinates,
    this.checkInTime,
    this.checkOutTime,
    this.ratePerNight,
    this.totalRate,
    this.prices,
    this.nearbyPlaces,
    this.images,
    this.overallRating,
    this.reviews,
    this.locationRating,
    this.amenities,
    this.excludedAmenities,
    this.essentialInfo,
    this.description,
    this.deal,
    this.dealDescription,
    this.hotelClass,
    this.extractedHotelClass,
    this.ratings,
    this.reviewsBreakdown,
    this.ecoCertified,
  });

  factory Property.fromMap(Map<String, dynamic> data) => Property(
        type: data['type'] as String?,
        name: data['name'] as String?,
        link: data['link'] as String?,
        propertyToken: data['property_token'] as String?,
        serpapiPropertyDetailsLink:
            data['serpapi_property_details_link'] as String?,
        gpsCoordinates: data['gps_coordinates'] == null
            ? null
            : GpsCoordinates.fromMap(
                data['gps_coordinates'] as Map<String, dynamic>),
        checkInTime: data['check_in_time'] as String?,
        checkOutTime: data['check_out_time'] as String?,
        ratePerNight: data['rate_per_night'] == null
            ? null
            : RatePerNight.fromMap(
                data['rate_per_night'] as Map<String, dynamic>),
        totalRate: data['total_rate'] == null
            ? null
            : TotalRate.fromMap(data['total_rate'] as Map<String, dynamic>),
        prices: (data['prices'] as List<dynamic>?)
            ?.map((e) => Price.fromMap(e as Map<String, dynamic>))
            .toList(),
        nearbyPlaces: (data['nearby_places'] as List<dynamic>?)
            ?.map((e) => NearbyPlace.fromMap(e as Map<String, dynamic>))
            .toList(),
        images: (data['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        overallRating: (data['overall_rating'] as num?)?.toDouble(),
        reviews: data['reviews'] as int?,
        locationRating: (data['location_rating'] as num?)?.toDouble(),
        amenities: data['amenities'] as List<String>?,
        excludedAmenities: data['excluded_amenities'] as List<String>?,
        essentialInfo: data['essential_info'] as List<String>?,
        description: data['description'] as String?,
        deal: data['deal'] as String?,
        dealDescription: data['deal_description'] as String?,
        hotelClass: data['hotel_class'] as String?,
        extractedHotelClass: data['extracted_hotel_class'] as int?,
        ratings: (data['ratings'] as List<dynamic>?)
            ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
            .toList(),
        reviewsBreakdown: (data['reviews_breakdown'] as List<dynamic>?)
            ?.map((e) => ReviewsBreakdown.fromMap(e as Map<String, dynamic>))
            .toList(),
        ecoCertified: data['eco_certified'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'name': name,
        'link': link,
        'property_token': propertyToken,
        'serpapi_property_details_link': serpapiPropertyDetailsLink,
        'gps_coordinates': gpsCoordinates?.toMap(),
        'check_in_time': checkInTime,
        'check_out_time': checkOutTime,
        'rate_per_night': ratePerNight?.toMap(),
        'total_rate': totalRate?.toMap(),
        'prices': prices?.map((e) => e.toMap()).toList(),
        'nearby_places': nearbyPlaces?.map((e) => e.toMap()).toList(),
        'images': images?.map((e) => e.toJson()).toList(),
        'overall_rating': overallRating,
        'reviews': reviews,
        'location_rating': locationRating,
        'amenities': amenities,
        'excluded_amenities': excludedAmenities,
        'essential_info': essentialInfo,
        'description': description,
        'deal': deal,
        'deal_description': dealDescription,
        'hotel_class': hotelClass,
        'extracted_hotel_class': extractedHotelClass,
        'ratings': ratings?.map((e) => e.toJson()).toList(),
        'reviews_breakdown': reviewsBreakdown?.map((e) => e.toMap()).toList(),
        'eco_certified': ecoCertified,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Property].
  factory Property.fromJson(String data) {
    return Property.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Property] to a JSON string.
  String toJson() => json.encode(toMap());
}
