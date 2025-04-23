// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resturant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestaurantResponseAdapter extends TypeAdapter<RestaurantResponse> {
  @override
  final int typeId = 20;

  @override
  RestaurantResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantResponse(
      totalRecords: fields[0] as int,
      totalPages: fields[1] as int,
      restaurants: (fields[2] as List).cast<RestaurantModel>(),
      currentPage: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.totalRecords)
      ..writeByte(1)
      ..write(obj.totalPages)
      ..writeByte(2)
      ..write(obj.restaurants)
      ..writeByte(3)
      ..write(obj.currentPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
  @override
  final int typeId = 21;

  @override
  RestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantModel(
      restaurantId: fields[0] as String,
      locationId: fields[1] as int,
      name: fields[2] as String,
      averageRating: fields[3] as double,
      userReviewCount: fields[4] as int,
      currentOpenStatusCategory: fields[5] as String,
      currentOpenStatusText: fields[6] as String,
      priceTag: fields[7] as String,
      hasMenu: fields[8] as bool,
      menuUrl: fields[9] as String?,
      isDifferentGeo: fields[10] as bool,
      parentGeoName: fields[11] as String,
      distanceTo: fields[12] as dynamic,
      awardInfo: fields[13] as AwardInfo?,
      isLocalChefItem: fields[14] as bool,
      isPremium: fields[15] as bool,
      isStoryboardPublished: fields[16] as bool,
      establishmentTypeAndCuisineTags: (fields[17] as List).cast<String>(),
      offers: fields[18] as Offers,
      heroImgUrl: fields[19] as String,
      heroImgRawHeight: fields[20] as int,
      heroImgRawWidth: fields[21] as int,
      squareImgUrl: fields[22] as String,
      squareImgRawLength: fields[23] as int,
      thumbnail: fields[24] as Thumbnail,
      reviewSnippets: fields[25] as ReviewSnippets,
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantModel obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.restaurantId)
      ..writeByte(1)
      ..write(obj.locationId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.averageRating)
      ..writeByte(4)
      ..write(obj.userReviewCount)
      ..writeByte(5)
      ..write(obj.currentOpenStatusCategory)
      ..writeByte(6)
      ..write(obj.currentOpenStatusText)
      ..writeByte(7)
      ..write(obj.priceTag)
      ..writeByte(8)
      ..write(obj.hasMenu)
      ..writeByte(9)
      ..write(obj.menuUrl)
      ..writeByte(10)
      ..write(obj.isDifferentGeo)
      ..writeByte(11)
      ..write(obj.parentGeoName)
      ..writeByte(12)
      ..write(obj.distanceTo)
      ..writeByte(13)
      ..write(obj.awardInfo)
      ..writeByte(14)
      ..write(obj.isLocalChefItem)
      ..writeByte(15)
      ..write(obj.isPremium)
      ..writeByte(16)
      ..write(obj.isStoryboardPublished)
      ..writeByte(17)
      ..write(obj.establishmentTypeAndCuisineTags)
      ..writeByte(18)
      ..write(obj.offers)
      ..writeByte(19)
      ..write(obj.heroImgUrl)
      ..writeByte(20)
      ..write(obj.heroImgRawHeight)
      ..writeByte(21)
      ..write(obj.heroImgRawWidth)
      ..writeByte(22)
      ..write(obj.squareImgUrl)
      ..writeByte(23)
      ..write(obj.squareImgRawLength)
      ..writeByte(24)
      ..write(obj.thumbnail)
      ..writeByte(25)
      ..write(obj.reviewSnippets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AwardInfoAdapter extends TypeAdapter<AwardInfo> {
  @override
  final int typeId = 22;

  @override
  AwardInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AwardInfo(
      year: fields[0] as int?,
      awardType: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AwardInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.year)
      ..writeByte(1)
      ..write(obj.awardType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AwardInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OffersAdapter extends TypeAdapter<Offers> {
  @override
  final int typeId = 23;

  @override
  Offers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Offers(
      hasDelivery: fields[0] as bool?,
      hasReservation: fields[1] as bool?,
      slot1Offer: fields[2] as SlotOffer?,
      slot2Offer: fields[3] as SlotOffer?,
      restaurantSpecialOffer: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Offers obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.hasDelivery)
      ..writeByte(1)
      ..write(obj.hasReservation)
      ..writeByte(2)
      ..write(obj.slot1Offer)
      ..writeByte(3)
      ..write(obj.slot2Offer)
      ..writeByte(4)
      ..write(obj.restaurantSpecialOffer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SlotOfferAdapter extends TypeAdapter<SlotOffer> {
  @override
  final int typeId = 24;

  @override
  SlotOffer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SlotOffer(
      providerId: fields[0] as String?,
      provider: fields[1] as String?,
      providerDisplayName: fields[2] as String?,
      buttonText: fields[3] as String?,
      offerURL: fields[4] as String?,
      logoUrl: fields[5] as String?,
      trackingEvent: fields[6] as String?,
      canProvideTimeslots: fields[7] as bool?,
      canLockTimeslots: fields[8] as bool?,
      timeSlots: (fields[9] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, SlotOffer obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.providerId)
      ..writeByte(1)
      ..write(obj.provider)
      ..writeByte(2)
      ..write(obj.providerDisplayName)
      ..writeByte(3)
      ..write(obj.buttonText)
      ..writeByte(4)
      ..write(obj.offerURL)
      ..writeByte(5)
      ..write(obj.logoUrl)
      ..writeByte(6)
      ..write(obj.trackingEvent)
      ..writeByte(7)
      ..write(obj.canProvideTimeslots)
      ..writeByte(8)
      ..write(obj.canLockTimeslots)
      ..writeByte(9)
      ..write(obj.timeSlots);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlotOfferAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThumbnailAdapter extends TypeAdapter<Thumbnail> {
  @override
  final int typeId = 25;

  @override
  Thumbnail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thumbnail(
      photo: fields[0] as Photo?,
    );
  }

  @override
  void write(BinaryWriter writer, Thumbnail obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 26;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      photoSizeDynamic: fields[0] as PhotoSizeDynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.photoSizeDynamic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoSizeDynamicAdapter extends TypeAdapter<PhotoSizeDynamic> {
  @override
  final int typeId = 27;

  @override
  PhotoSizeDynamic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoSizeDynamic(
      urlTemplate: fields[0] as String,
      maxHeight: fields[1] as int,
      maxWidth: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoSizeDynamic obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.urlTemplate)
      ..writeByte(1)
      ..write(obj.maxHeight)
      ..writeByte(2)
      ..write(obj.maxWidth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoSizeDynamicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewSnippetsAdapter extends TypeAdapter<ReviewSnippets> {
  @override
  final int typeId = 28;

  @override
  ReviewSnippets read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewSnippets(
      reviewSnippetsList: (fields[0] as List).cast<ReviewSnippet>(),
    );
  }

  @override
  void write(BinaryWriter writer, ReviewSnippets obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.reviewSnippetsList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewSnippetsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewSnippetAdapter extends TypeAdapter<ReviewSnippet> {
  @override
  final int typeId = 29;

  @override
  ReviewSnippet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewSnippet(
      reviewText: fields[0] as String,
      reviewUrl: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewSnippet obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.reviewText)
      ..writeByte(1)
      ..write(obj.reviewUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewSnippetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
