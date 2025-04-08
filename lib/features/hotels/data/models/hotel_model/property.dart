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
  final String type;
  final String name;
  final String link;
  final String propertyToken;
  final String serpapiPropertyDetailsLink;
  final GpsCoordinates? gpsCoordinates;
  final String checkInTime;
  final String checkOutTime;
  final RatePerNight? ratePerNight;
  final TotalRate? totalRate;
  final List<Price> prices;
  final List<NearbyPlace> nearbyPlaces;
  final ImageCollection? images;
  final double overallRating;
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
  final List<Rating> ratings;
  final List<ReviewsBreakdown> reviewsBreakdown;
  final bool ecoCertified;

  Property({
    String? type,
    String? name,
    String? link,
    String? propertyToken,
    String? serpapiPropertyDetailsLink,
    this.gpsCoordinates,
    String? checkInTime,
    String? checkOutTime,
    this.ratePerNight,
    this.totalRate,
    List<Price>? prices,
    List<NearbyPlace>? nearbyPlaces,
    this.images,
    double? overallRating,
    int? reviews,
    double? locationRating,
    List<String>? amenities,
    List<String>? excludedAmenities,
    List<String>? essentialInfo,
    String? description,
    String? deal,
    String? dealDescription,
    String? hotelClass,
    int? extractedHotelClass,
    List<Rating>? ratings,
    List<ReviewsBreakdown>? reviewsBreakdown,
    bool? ecoCertified,
  })  : type = type ?? '',
        name = name ?? '',
        link = link ?? '',
        propertyToken = propertyToken ?? '',
        serpapiPropertyDetailsLink = serpapiPropertyDetailsLink ?? '',
        checkInTime = checkInTime ?? '',
        checkOutTime = checkOutTime ?? '',
        prices = prices ?? [],
        nearbyPlaces = nearbyPlaces ?? [],
        overallRating = overallRating ?? 0.0,
        reviews = reviews ?? 0,
        locationRating = locationRating ?? 0.0,
        amenities = amenities ?? [],
        excludedAmenities = excludedAmenities ?? [],
        essentialInfo = essentialInfo ?? [],
        description = description ?? '',
        deal = deal ?? '',
        dealDescription = dealDescription ?? '',
        hotelClass = hotelClass ?? '',
        extractedHotelClass = extractedHotelClass ?? 0,
        ratings = ratings ?? [],
        reviewsBreakdown = reviewsBreakdown ?? [],
        ecoCertified = ecoCertified ?? false;

  factory Property.fromMap(Map<String, dynamic> data) => Property(
        type: data['type'] as String? ?? '',
        name: data['name'] as String? ?? '',
        link: data['link'] as String? ?? '',
        propertyToken: data['property_token'] as String? ?? '',
        serpapiPropertyDetailsLink:
            data['serpapi_property_details_link'] as String? ?? '',
        gpsCoordinates: data['gps_coordinates'] == null
            ? null
            : GpsCoordinates.fromMap(
                data['gps_coordinates'] as Map<String, dynamic>),
        checkInTime: data['check_in_time'] as String? ?? '',
        checkOutTime: data['check_out_time'] as String? ?? '',
        ratePerNight: data['rate_per_night'] == null
            ? null
            : RatePerNight.fromMap(
                data['rate_per_night'] as Map<String, dynamic>),
        totalRate: data['total_rate'] == null
            ? null
            : TotalRate.fromMap(data['total_rate'] as Map<String, dynamic>),
        prices: (data['prices'] as List<dynamic>?)
                ?.map((e) => Price.fromMap(e as Map<String, dynamic>))
                .toList() ??
            [],
        nearbyPlaces: (data['nearby_places'] as List<dynamic>?)
                ?.map((e) => NearbyPlace.fromMap(e as Map<String, dynamic>))
                .toList() ??
            [],
        images: data['images'] == null
            ? null
            : ImageCollection.fromJson(data['images'] as Map<String, dynamic>),
        overallRating: (data['overall_rating'] as num?)?.toDouble() ?? 0.0,
        reviews: data['reviews'] as int? ?? 0,
        locationRating: (data['location_rating'] as num?)?.toDouble() ?? 0.0,
        amenities: (data['amenities'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        excludedAmenities: (data['excluded_amenities'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        essentialInfo: (data['essential_info'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        description: data['description'] as String? ?? '',
        deal: data['deal'] as String? ?? '',
        dealDescription: data['deal_description'] as String? ?? '',
        hotelClass: data['hotel_class'] as String? ?? '',
        extractedHotelClass: data['extracted_hotel_class'] as int? ?? 0,
        ratings: (data['ratings'] as List<dynamic>?)
                ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        reviewsBreakdown: (data['reviews_breakdown'] as List<dynamic>?)
                ?.map((e) => ReviewsBreakdown.fromMap(e as Map<String, dynamic>))
                .toList() ??
            [],
        ecoCertified: data['eco_certified'] as bool? ?? false,
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
        'prices': prices.map((e) => e.toMap()).toList(),
        'nearby_places': nearbyPlaces.map((e) => e.toMap()).toList(),
        'images': images?.toJson(),
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
        'ratings': ratings.map((e) => e.toJson()).toList(),
        'reviews_breakdown': reviewsBreakdown.map((e) => e.toMap()).toList(),
        'eco_certified': ecoCertified,
      };

  factory Property.fromJson(String data) {
    return Property.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}