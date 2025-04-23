import 'package:hive/hive.dart';

part 'restaurant_model.g.dart';

@HiveType(typeId: 20)
class RestaurantResponse {
  @HiveField(0)
  final int totalRecords;

  @HiveField(1)
  final int totalPages;

  @HiveField(2)
  final List<RestaurantModel> restaurants;

  @HiveField(3)
  final int currentPage;

  RestaurantResponse({
    required this.totalRecords,
    required this.totalPages,
    required this.restaurants,
    required this.currentPage,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantResponse(
      totalRecords: json['totalRecords'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      restaurants: (json['data'] as List<dynamic>?)
              ?.map((item) => RestaurantModel.fromJson(item))
              .toList() ??
          [],
      currentPage: json['currentPage'] ?? 0,
    );
  }
}

@HiveType(typeId: 21)
class RestaurantModel {
  @HiveField(0)
  final String restaurantId;

  @HiveField(1)
  final int locationId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final double averageRating;

  @HiveField(4)
  final int userReviewCount;

  @HiveField(5)
  final String currentOpenStatusCategory;

  @HiveField(6)
  final String currentOpenStatusText;

  @HiveField(7)
  final String priceTag;

  @HiveField(8)
  final bool hasMenu;

  @HiveField(9)
  final String? menuUrl;

  @HiveField(10)
  final bool isDifferentGeo;

  @HiveField(11)
  final String parentGeoName;

  @HiveField(12)
  final dynamic distanceTo;

  @HiveField(13)
  final AwardInfo? awardInfo;

  @HiveField(14)
  final bool isLocalChefItem;

  @HiveField(15)
  final bool isPremium;

  @HiveField(16)
  final bool isStoryboardPublished;

  @HiveField(17)
  final List<String> establishmentTypeAndCuisineTags;

  @HiveField(18)
  final Offers offers;

  @HiveField(19)
  final String heroImgUrl;

  @HiveField(20)
  final int heroImgRawHeight;

  @HiveField(21)
  final int heroImgRawWidth;

  @HiveField(22)
  final String squareImgUrl;

  @HiveField(23)
  final int squareImgRawLength;

  @HiveField(24)
  final Thumbnail thumbnail;

  @HiveField(25)
  final ReviewSnippets reviewSnippets;

  RestaurantModel({
    required this.restaurantId,
    required this.locationId,
    required this.name,
    required this.averageRating,
    required this.userReviewCount,
    required this.currentOpenStatusCategory,
    required this.currentOpenStatusText,
    required this.priceTag,
    required this.hasMenu,
    this.menuUrl,
    required this.isDifferentGeo,
    required this.parentGeoName,
    this.distanceTo,
    this.awardInfo,
    required this.isLocalChefItem,
    required this.isPremium,
    required this.isStoryboardPublished,
    required this.establishmentTypeAndCuisineTags,
    required this.offers,
    required this.heroImgUrl,
    required this.heroImgRawHeight,
    required this.heroImgRawWidth,
    required this.squareImgUrl,
    required this.squareImgRawLength,
    required this.thumbnail,
    required this.reviewSnippets,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantId: json['restaurantId'] ?? '',
      locationId: json['locationId'] ?? 0,
      name: json['name'] ?? '',
      averageRating: (json['averageRating'] ?? 0.0).toDouble(),
      userReviewCount: json['userReviewCount'] ?? 0,
      currentOpenStatusCategory: json['currentOpenStatusCategory'] ?? '',
      currentOpenStatusText: json['currentOpenStatusText'] ?? '',
      priceTag: json['priceTag'] ?? '',
      hasMenu: json['hasMenu'] ?? false,
      menuUrl: json['menuUrl'],
      isDifferentGeo: json['isDifferentGeo'] ?? false,
      parentGeoName: json['parentGeoName'] ?? '',
      distanceTo: json['distanceTo'],
      awardInfo: json['awardInfo'] != null
          ? AwardInfo.fromJson(json['awardInfo'])
          : null,
      isLocalChefItem: json['isLocalChefItem'] ?? false,
      isPremium: json['isPremium'] ?? false,
      isStoryboardPublished: json['isStoryboardPublished'] ?? false,
      establishmentTypeAndCuisineTags:
          (json['establishmentTypeAndCuisineTags'] as List<dynamic>?)
                  ?.cast<String>() ??
              [],
      offers: Offers.fromJson(json['offers'] ?? {}),
      heroImgUrl: json['heroImgUrl'] ?? '',
      heroImgRawHeight: json['heroImgRawHeight'] ?? 0,
      heroImgRawWidth: json['heroImgRawWidth'] ?? 0,
      squareImgUrl: json['squareImgUrl'] ?? '',
      squareImgRawLength: json['squareImgRawLength'] ?? 0,
      thumbnail: Thumbnail.fromJson(json['thumbnail'] ?? {}),
      reviewSnippets: ReviewSnippets.fromJson(json['reviewSnippets'] ?? {}),
    );
  }
}

@HiveType(typeId: 22)
class AwardInfo {
  @HiveField(0)
  final int? year;

  @HiveField(1)
  final String? awardType;

  AwardInfo({
    this.year,
    this.awardType,
  });

  factory AwardInfo.fromJson(Map<String, dynamic> json) {
    return AwardInfo(
      year: json['year'],
      awardType: json['awardType'],
    );
  }
}

@HiveType(typeId: 23)
class Offers {
  @HiveField(0)
  final bool? hasDelivery;

  @HiveField(1)
  final bool? hasReservation;

  @HiveField(2)
  final SlotOffer? slot1Offer;

  @HiveField(3)
  final SlotOffer? slot2Offer;

  @HiveField(4)
  final dynamic restaurantSpecialOffer;

  Offers({
    this.hasDelivery,
    this.hasReservation,
    this.slot1Offer,
    this.slot2Offer,
    this.restaurantSpecialOffer,
  });

  factory Offers.fromJson(Map<String, dynamic> json) {
    return Offers(
      hasDelivery: json['hasDelivery'],
      hasReservation: json['hasReservation'],
      slot1Offer: json['slot1Offer'] != null
          ? SlotOffer.fromJson(json['slot1Offer'])
          : null,
      slot2Offer: json['slot2Offer'] != null
          ? SlotOffer.fromJson(json['slot2Offer'])
          : null,
      restaurantSpecialOffer: json['restaurantSpecialOffer'],
    );
  }
}

@HiveType(typeId: 24)
class SlotOffer {
  @HiveField(0)
  final String? providerId;

  @HiveField(1)
  final String? provider;

  @HiveField(2)
  final String? providerDisplayName;

  @HiveField(3)
  final String? buttonText;

  @HiveField(4)
  final String? offerURL;

  @HiveField(5)
  final String? logoUrl;

  @HiveField(6)
  final String? trackingEvent;

  @HiveField(7)
  final bool? canProvideTimeslots;

  @HiveField(8)
  final bool? canLockTimeslots;

  @HiveField(9)
  final List<dynamic> timeSlots;

  SlotOffer({
    this.providerId,
    this.provider,
    this.providerDisplayName,
    this.buttonText,
    this.offerURL,
    this.logoUrl,
    this.trackingEvent,
    this.canProvideTimeslots,
    this.canLockTimeslots,
    required this.timeSlots,
  });

  factory SlotOffer.fromJson(Map<String, dynamic> json) {
    return SlotOffer(
      providerId: json['providerId'],
      provider: json['provider'],
      providerDisplayName: json['providerDisplayName'],
      buttonText: json['buttonText'],
      offerURL: json['offerURL'],
      logoUrl: json['logoUrl'],
      trackingEvent: json['trackingEvent'],
      canProvideTimeslots: json['canProvideTimeslots'],
      canLockTimeslots: json['canLockTimeslots'],
      timeSlots: json['timeSlots'] ?? [],
    );
  }
}

@HiveType(typeId: 25)
class Thumbnail {
  @HiveField(0)
  final Photo? photo;

  Thumbnail({
    this.photo,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      photo: json['photo'] != null ? Photo.fromJson(json['photo']) : null,
    );
  }
}

@HiveType(typeId: 26)
class Photo {
  @HiveField(0)
  final PhotoSizeDynamic photoSizeDynamic;

  Photo({
    required this.photoSizeDynamic,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      photoSizeDynamic:
          PhotoSizeDynamic.fromJson(json['photoSizeDynamic'] ?? {}),
    );
  }
}

@HiveType(typeId: 27)
class PhotoSizeDynamic {
  @HiveField(0)
  final String urlTemplate;

  @HiveField(1)
  final int maxHeight;

  @HiveField(2)
  final int maxWidth;

  PhotoSizeDynamic({
    required this.urlTemplate,
    required this.maxHeight,
    required this.maxWidth,
  });

  factory PhotoSizeDynamic.fromJson(Map<String, dynamic> json) {
    return PhotoSizeDynamic(
      urlTemplate: json['urlTemplate'] ?? '',
      maxHeight: json['maxHeight'] ?? 0,
      maxWidth: json['maxWidth'] ?? 0,
    );
  }
}

@HiveType(typeId: 28)
class ReviewSnippets {
  @HiveField(0)
  final List<ReviewSnippet> reviewSnippetsList;

  ReviewSnippets({
    required this.reviewSnippetsList,
  });

  factory ReviewSnippets.fromJson(Map<String, dynamic> json) {
    return ReviewSnippets(
      reviewSnippetsList: (json['reviewSnippetsList'] as List<dynamic>?)
              ?.map((item) => ReviewSnippet.fromJson(item))
              .toList() ??
          [],
    );
  }
}

@HiveType(typeId: 29)
class ReviewSnippet {
  @HiveField(0)
  final String reviewText;

  @HiveField(1)
  final String reviewUrl;

  ReviewSnippet({
    required this.reviewText,
    required this.reviewUrl,
  });

  factory ReviewSnippet.fromJson(Map<String, dynamic> json) {
    return ReviewSnippet(
      reviewText: json['reviewText'] ?? '',
      reviewUrl: json['reviewUrl'] ?? '',
    );
  }
}