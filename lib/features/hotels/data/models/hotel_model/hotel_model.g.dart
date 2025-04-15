// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelModelAdapter extends TypeAdapter<HotelModel> {
  @override
  final int typeId = 0;

  @override
  HotelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HotelModel(
      searchMetadata: fields[0] as SearchMetadata?,
      searchParameters: fields[1] as SearchParameters?,
      searchInformation: fields[2] as SearchInformation?,
      brands: (fields[3] as List?)?.cast<Brands>(),
      properties: (fields[4] as List?)?.cast<Properties>(),
      serpapiPagination: fields[5] as SerpapiPagination?,
    );
  }

  @override
  void write(BinaryWriter writer, HotelModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.searchMetadata)
      ..writeByte(1)
      ..write(obj.searchParameters)
      ..writeByte(2)
      ..write(obj.searchInformation)
      ..writeByte(3)
      ..write(obj.brands)
      ..writeByte(4)
      ..write(obj.properties)
      ..writeByte(5)
      ..write(obj.serpapiPagination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SerpapiPaginationAdapter extends TypeAdapter<SerpapiPagination> {
  @override
  final int typeId = 1;

  @override
  SerpapiPagination read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SerpapiPagination(
      currentFrom: fields[0] as num?,
      currentTo: fields[1] as num?,
      nextPageToken: fields[2] as String?,
      next: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SerpapiPagination obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.currentFrom)
      ..writeByte(1)
      ..write(obj.currentTo)
      ..writeByte(2)
      ..write(obj.nextPageToken)
      ..writeByte(3)
      ..write(obj.next);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerpapiPaginationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PropertiesAdapter extends TypeAdapter<Properties> {
  @override
  final int typeId = 2;

  @override
  Properties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Properties(
      type: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      link: fields[3] as String?,
      propertyToken: fields[4] as String?,
      serpapiPropertyDetailsLink: fields[5] as String?,
      gpsCoordinates: fields[6] as GpsCoordinates?,
      checkInTime: fields[7] as String?,
      checkOutTime: fields[8] as String?,
      ratePerNight: fields[9] as RatePerNight?,
      totalRate: fields[10] as TotalRate?,
      deal: fields[11] as String?,
      dealDescription: fields[12] as String?,
      nearbyPlaces: (fields[13] as List?)?.cast<NearbyPlaces>(),
      images: (fields[14] as List?)?.cast<Images>(),
      overallRating: fields[15] as num?,
      reviews: fields[16] as num?,
      ratings: (fields[17] as List?)?.cast<Ratings>(),
      locationRating: fields[18] as num?,
      reviewsBreakdown: (fields[19] as List?)?.cast<ReviewsBreakdown>(),
      amenities: (fields[20] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Properties obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.link)
      ..writeByte(4)
      ..write(obj.propertyToken)
      ..writeByte(5)
      ..write(obj.serpapiPropertyDetailsLink)
      ..writeByte(6)
      ..write(obj.gpsCoordinates)
      ..writeByte(7)
      ..write(obj.checkInTime)
      ..writeByte(8)
      ..write(obj.checkOutTime)
      ..writeByte(9)
      ..write(obj.ratePerNight)
      ..writeByte(10)
      ..write(obj.totalRate)
      ..writeByte(11)
      ..write(obj.deal)
      ..writeByte(12)
      ..write(obj.dealDescription)
      ..writeByte(13)
      ..write(obj.nearbyPlaces)
      ..writeByte(14)
      ..write(obj.images)
      ..writeByte(15)
      ..write(obj.overallRating)
      ..writeByte(16)
      ..write(obj.reviews)
      ..writeByte(17)
      ..write(obj.ratings)
      ..writeByte(18)
      ..write(obj.locationRating)
      ..writeByte(19)
      ..write(obj.reviewsBreakdown)
      ..writeByte(20)
      ..write(obj.amenities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewsBreakdownAdapter extends TypeAdapter<ReviewsBreakdown> {
  @override
  final int typeId = 3;

  @override
  ReviewsBreakdown read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewsBreakdown(
      name: fields[0] as String?,
      description: fields[1] as String?,
      totalMentioned: fields[2] as num?,
      positive: fields[3] as num?,
      negative: fields[4] as num?,
      neutral: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewsBreakdown obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.totalMentioned)
      ..writeByte(3)
      ..write(obj.positive)
      ..writeByte(4)
      ..write(obj.negative)
      ..writeByte(5)
      ..write(obj.neutral);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsBreakdownAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatingsAdapter extends TypeAdapter<Ratings> {
  @override
  final int typeId = 4;

  @override
  Ratings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ratings(
      stars: fields[0] as num?,
      count: fields[1] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, Ratings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.stars)
      ..writeByte(1)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImagesAdapter extends TypeAdapter<Images> {
  @override
  final int typeId = 5;

  @override
  Images read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Images(
      thumbnail: fields[0] as String?,
      originalImage: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Images obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.thumbnail)
      ..writeByte(1)
      ..write(obj.originalImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NearbyPlacesAdapter extends TypeAdapter<NearbyPlaces> {
  @override
  final int typeId = 6;

  @override
  NearbyPlaces read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NearbyPlaces(
      name: fields[0] as String?,
      transportations: (fields[1] as List?)?.cast<Transportations>(),
    );
  }

  @override
  void write(BinaryWriter writer, NearbyPlaces obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.transportations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NearbyPlacesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransportationsAdapter extends TypeAdapter<Transportations> {
  @override
  final int typeId = 7;

  @override
  Transportations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transportations(
      type: fields[0] as String?,
      duration: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Transportations obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransportationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalRateAdapter extends TypeAdapter<TotalRate> {
  @override
  final int typeId = 8;

  @override
  TotalRate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalRate(
      lowest: fields[0] as String?,
      extractedLowest: fields[1] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalRate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lowest)
      ..writeByte(1)
      ..write(obj.extractedLowest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalRateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RatePerNightAdapter extends TypeAdapter<RatePerNight> {
  @override
  final int typeId = 9;

  @override
  RatePerNight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RatePerNight(
      lowest: fields[0] as String?,
      extractedLowest: fields[1] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, RatePerNight obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lowest)
      ..writeByte(1)
      ..write(obj.extractedLowest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RatePerNightAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GpsCoordinatesAdapter extends TypeAdapter<GpsCoordinates> {
  @override
  final int typeId = 10;

  @override
  GpsCoordinates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GpsCoordinates(
      latitude: fields[0] as num?,
      longitude: fields[1] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, GpsCoordinates obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GpsCoordinatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrandsAdapter extends TypeAdapter<Brands> {
  @override
  final int typeId = 11;

  @override
  Brands read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brands(
      id: fields[0] as num?,
      name: fields[1] as String?,
      children: (fields[2] as List?)?.cast<Children>(),
    );
  }

  @override
  void write(BinaryWriter writer, Brands obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.children);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChildrenAdapter extends TypeAdapter<Children> {
  @override
  final int typeId = 12;

  @override
  Children read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Children(
      id: fields[0] as num?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Children obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildrenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchInformationAdapter extends TypeAdapter<SearchInformation> {
  @override
  final int typeId = 13;

  @override
  SearchInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchInformation(
      totalResults: fields[0] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchInformation obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchParametersAdapter extends TypeAdapter<SearchParameters> {
  @override
  final int typeId = 14;

  @override
  SearchParameters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchParameters(
      engine: fields[0] as String?,
      q: fields[1] as String?,
      gl: fields[2] as String?,
      hl: fields[3] as String?,
      currency: fields[4] as String?,
      checkInDate: fields[5] as String?,
      checkOutDate: fields[6] as String?,
      adults: fields[7] as num?,
      children: fields[8] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchParameters obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.engine)
      ..writeByte(1)
      ..write(obj.q)
      ..writeByte(2)
      ..write(obj.gl)
      ..writeByte(3)
      ..write(obj.hl)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.checkInDate)
      ..writeByte(6)
      ..write(obj.checkOutDate)
      ..writeByte(7)
      ..write(obj.adults)
      ..writeByte(8)
      ..write(obj.children);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchParametersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchMetadataAdapter extends TypeAdapter<SearchMetadata> {
  @override
  final int typeId = 15;

  @override
  SearchMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchMetadata(
      id: fields[0] as String?,
      status: fields[1] as String?,
      jsonEndpoint: fields[2] as String?,
      createdAt: fields[3] as String?,
      processedAt: fields[4] as String?,
      googleHotelsUrl: fields[5] as String?,
      rawHtmlFile: fields[6] as String?,
      prettifyHtmlFile: fields[7] as String?,
      totalTimeTaken: fields[8] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchMetadata obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.jsonEndpoint)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.processedAt)
      ..writeByte(5)
      ..write(obj.googleHotelsUrl)
      ..writeByte(6)
      ..write(obj.rawHtmlFile)
      ..writeByte(7)
      ..write(obj.prettifyHtmlFile)
      ..writeByte(8)
      ..write(obj.totalTimeTaken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
