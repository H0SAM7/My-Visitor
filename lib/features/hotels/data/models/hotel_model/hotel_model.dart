import 'package:hive/hive.dart';

part 'hotel_model.g.dart';

@HiveType(typeId: 0)
class HotelModel extends HiveObject {
  @HiveField(0)
  SearchMetadata? searchMetadata;
  @HiveField(1)
  SearchParameters? searchParameters;
  @HiveField(2)
  SearchInformation? searchInformation;
  @HiveField(3)
  List<Brands>? brands;
  @HiveField(4)
  List<Properties>? properties;
  @HiveField(5)
  SerpapiPagination? serpapiPagination;

  HotelModel(
      {this.searchMetadata,
      this.searchParameters,
      this.searchInformation,
      this.brands,
      this.properties,
      this.serpapiPagination});

  HotelModel.fromJson(Map<String, dynamic> json) {
    searchMetadata = json["search_metadata"] == null
        ? null
        : SearchMetadata.fromJson(json["search_metadata"]);
    searchParameters = json["search_parameters"] == null
        ? null
        : SearchParameters.fromJson(json["search_parameters"]);
    searchInformation = json["search_information"] == null
        ? null
        : SearchInformation.fromJson(json["search_information"]);
    brands = json["brands"] == null
        ? null
        : (json["brands"] as List).map((e) => Brands.fromJson(e)).toList();
    properties = json["properties"] == null
        ? null
        : (json["properties"] as List)
            .map((e) => Properties.fromJson(e))
            .toList();
    serpapiPagination = json["serpapi_pagination"] == null
        ? null
        : SerpapiPagination.fromJson(json["serpapi_pagination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (searchMetadata != null) {
      _data["search_metadata"] = searchMetadata?.toJson();
    }
    if (searchParameters != null) {
      _data["search_parameters"] = searchParameters?.toJson();
    }
    if (searchInformation != null) {
      _data["search_information"] = searchInformation?.toJson();
    }
    if (brands != null) {
      _data["brands"] = brands?.map((e) => e.toJson()).toList();
    }
    if (properties != null) {
      _data["properties"] = properties?.map((e) => e.toJson()).toList();
    }
    if (serpapiPagination != null) {
      _data["serpapi_pagination"] = serpapiPagination?.toJson();
    }
    return _data;
  }
}

@HiveType(typeId: 1)
class SerpapiPagination extends HiveObject {
  @HiveField(0)
  num? currentFrom;
  @HiveField(1)
  num? currentTo;
  @HiveField(2)
  String? nextPageToken;
  @HiveField(3)
  String? next;

  SerpapiPagination(
      {this.currentFrom, this.currentTo, this.nextPageToken, this.next});

  SerpapiPagination.fromJson(Map<String, dynamic> json) {
    currentFrom = json["current_from"];
    currentTo = json["current_to"];
    nextPageToken = json["next_page_token"];
    next = json["next"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_from"] = currentFrom;
    _data["current_to"] = currentTo;
    _data["next_page_token"] = nextPageToken;
    _data["next"] = next;
    return _data;
  }
}

@HiveType(typeId: 2)
class Properties extends HiveObject {
  @HiveField(0)
  String? type;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? link;

  @HiveField(4)
  String? propertyToken;

  @HiveField(5)
  String? serpapiPropertyDetailsLink;

  @HiveField(6)
  GpsCoordinates? gpsCoordinates;

  @HiveField(7)
  String? checkInTime;

  @HiveField(8)
  String? checkOutTime;

  @HiveField(9)
  RatePerNight? ratePerNight;

  @HiveField(10)
  TotalRate? totalRate;

  @HiveField(11)
  String? deal;

  @HiveField(12)
  String? dealDescription;

  @HiveField(13)
  List<NearbyPlaces>? nearbyPlaces;

  @HiveField(14)
  List<Images>? images;

  @HiveField(15)
  num? overallRating;

  @HiveField(16)
  num? reviews;

  @HiveField(17)
  List<Ratings>? ratings;

  @HiveField(18)
  num? locationRating;

  @HiveField(19)
  List<ReviewsBreakdown>? reviewsBreakdown;

  @HiveField(20)
  List<String>? amenities;
  Properties(
      {this.type,
      this.name,
      this.description,
      this.link,
      this.propertyToken,
      this.serpapiPropertyDetailsLink,
      this.gpsCoordinates,
      this.checkInTime,
      this.checkOutTime,
      this.ratePerNight,
      this.totalRate,
      this.deal,
      this.dealDescription,
      this.nearbyPlaces,
      this.images,
      this.overallRating,
      this.reviews,
      this.ratings,
      this.locationRating,
      this.reviewsBreakdown,
      this.amenities});

  Properties.fromJson(Map<String, dynamic> json) {
    type = json["type"] ?? "";
    name = json["name"] ?? "";
    description = json["description"] ?? "";
    link = json["link"] ?? "";
    propertyToken = json["property_token"] ?? "";
    serpapiPropertyDetailsLink = json["serpapi_property_details_link"] ?? "";
    gpsCoordinates = json["gps_coordinates"] != null
        ? GpsCoordinates.fromJson(json["gps_coordinates"])
        : GpsCoordinates();
    checkInTime = json["check_in_time"] ?? "";
    checkOutTime = json["check_out_time"] ?? "";
    ratePerNight = json["rate_per_night"] != null
        ? RatePerNight.fromJson(json["rate_per_night"])
        : RatePerNight();
    totalRate = json["total_rate"] != null
        ? TotalRate.fromJson(json["total_rate"])
        : TotalRate();
    deal = json["deal"] ?? "";
    dealDescription = json["deal_description"] ?? "";
    nearbyPlaces = (json["nearby_places"] as List?)
            ?.map((e) => NearbyPlaces.fromJson(e))
            .toList() ??
        [];
    images =
        (json["images"] as List?)?.map((e) => Images.fromJson(e)).toList() ??
            [];
    overallRating = json["overall_rating"] ?? 0.0;
    reviews = json["reviews"] ?? 0.0;
    ratings =
        (json["ratings"] as List?)?.map((e) => Ratings.fromJson(e)).toList() ??
            [];
    locationRating = json["location_rating"] ?? 0.0;
    reviewsBreakdown = (json["reviews_breakdown"] as List?)
            ?.map((e) => ReviewsBreakdown.fromJson(e))
            .toList() ??
        [];
    amenities = List<String>.from(json["amenities"] ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["name"] = name;
    _data["description"] = description;
    _data["link"] = link;
    _data["property_token"] = propertyToken;
    _data["serpapi_property_details_link"] = serpapiPropertyDetailsLink;
    if (gpsCoordinates != null) {
      _data["gps_coordinates"] = gpsCoordinates?.toJson();
    }
    _data["check_in_time"] = checkInTime;
    _data["check_out_time"] = checkOutTime;
    if (ratePerNight != null) {
      _data["rate_per_night"] = ratePerNight?.toJson();
    }
    if (totalRate != null) {
      _data["total_rate"] = totalRate?.toJson();
    }
    _data["deal"] = deal;
    _data["deal_description"] = dealDescription;
    if (nearbyPlaces != null) {
      _data["nearby_places"] = nearbyPlaces?.map((e) => e.toJson()).toList();
    }
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    _data["overall_rating"] = overallRating;
    _data["reviews"] = reviews;
    if (ratings != null) {
      _data["ratings"] = ratings?.map((e) => e.toJson()).toList();
    }
    _data["location_rating"] = locationRating;
    if (reviewsBreakdown != null) {
      _data["reviews_breakdown"] =
          reviewsBreakdown?.map((e) => e.toJson()).toList();
    }
    if (amenities != null) {
      _data["amenities"] = amenities;
    }
    return _data;
  }
}

@HiveType(typeId: 3)
class ReviewsBreakdown extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  num? totalMentioned;

  @HiveField(3)
  num? positive;

  @HiveField(4)
  num? negative;

  @HiveField(5)
  num? neutral;
  ReviewsBreakdown(
      {this.name,
      this.description,
      this.totalMentioned,
      this.positive,
      this.negative,
      this.neutral});

  ReviewsBreakdown.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    description = json["description"];
    totalMentioned = json["total_mentioned"];
    positive = json["positive"];
    negative = json["negative"];
    neutral = json["neutral"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["description"] = description;
    _data["total_mentioned"] = totalMentioned;
    _data["positive"] = positive;
    _data["negative"] = negative;
    _data["neutral"] = neutral;
    return _data;
  }
}

@HiveType(typeId: 4)
class Ratings extends HiveObject {
  @HiveField(0)
  num? stars;
  @HiveField(1)
  num? count;

  Ratings({this.stars, this.count});

  Ratings.fromJson(Map<String, dynamic> json) {
    stars = json["stars"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["stars"] = stars;
    _data["count"] = count;
    return _data;
  }
}

@HiveType(typeId: 5)
class Images extends HiveObject {
  @HiveField(0)
  String? thumbnail;
  @HiveField(1)
  String? originalImage;

  Images({this.thumbnail, this.originalImage});

  Images.fromJson(Map<String, dynamic> json) {
    thumbnail = json["thumbnail"];
    originalImage = json["original_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["thumbnail"] = thumbnail;
    _data["original_image"] = originalImage;
    return _data;
  }
}

@HiveType(typeId: 6)
class NearbyPlaces extends HiveObject {
  @HiveField(0)
  String? name;
@HiveField(1)
  List<Transportations>? transportations;

  NearbyPlaces({this.name, this.transportations});

  NearbyPlaces.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    transportations = json["transportations"] == null
        ? null
        : (json["transportations"] as List)
            .map((e) => Transportations.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    if (transportations != null) {
      _data["transportations"] =
          transportations?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

@HiveType(typeId: 7)
class Transportations extends HiveObject {
  @HiveField(0)
  String? type;
    @HiveField(1)
  String? duration;

  Transportations({this.type, this.duration});

  Transportations.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    duration = json["duration"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["duration"] = duration;
    return _data;
  }
}

@HiveType(typeId: 8)
class TotalRate extends HiveObject {
  @HiveField(0)
  String? lowest;
  @HiveField(1)
  num? extractedLowest;

  TotalRate({this.lowest, this.extractedLowest});

  TotalRate.fromJson(Map<String, dynamic> json) {
    lowest = json["lowest"];
    extractedLowest = json["extracted_lowest"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lowest"] = lowest;
    _data["extracted_lowest"] = extractedLowest;
    return _data;
  }
}

@HiveType(typeId: 9)
class RatePerNight extends HiveObject {
  @HiveField(0)
  String? lowest;
  @HiveField(1)
  num? extractedLowest;

  RatePerNight({this.lowest, this.extractedLowest});

  RatePerNight.fromJson(Map<String, dynamic> json) {
    lowest = json["lowest"];
    extractedLowest = json["extracted_lowest"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["lowest"] = lowest;
    _data["extracted_lowest"] = extractedLowest;
    return _data;
  }
}

@HiveType(typeId: 10)
class GpsCoordinates extends HiveObject {
  @HiveField(0)
  num? latitude;
  @HiveField(1)
  num? longitude;

  GpsCoordinates({this.latitude, this.longitude});

  GpsCoordinates.fromJson(Map<String, dynamic> json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    return _data;
  }
}

@HiveType(typeId: 11)
class Brands extends HiveObject {
  @HiveField(0)
  num? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  List<Children>? children;

  Brands({this.id, this.name, this.children});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    children = json["children"] == null
        ? null
        : (json["children"] as List).map((e) => Children.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if (children != null) {
      _data["children"] = children?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

@HiveType(typeId: 12)
class Children extends HiveObject {
  @HiveField(0)
  num? id;
  @HiveField(1)
  String? name;

  Children({this.id, this.name});

  Children.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

@HiveType(typeId: 13)
class SearchInformation extends HiveObject {
  @HiveField(0)
  num? totalResults;

  SearchInformation({this.totalResults});

  SearchInformation.fromJson(Map<String, dynamic> json) {
    totalResults = json["total_results"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_results"] = totalResults;
    return _data;
  }
}

@HiveType(typeId: 14)
class SearchParameters extends HiveObject {



@HiveField(0)
  String? engine;

  @HiveField(1)
  String? q;

  @HiveField(2)
  String? gl;

  @HiveField(3) // Fixed from 9 to 3 for sequential order
  String? hl;

  @HiveField(4)
  String? currency;

  @HiveField(5)
  String? checkInDate;

  @HiveField(6)
  String? checkOutDate;

  @HiveField(7)
  num? adults;

  @HiveField(8) // Fixed from 7 to 8, removed erroneous empty annotation
  num? children;
  SearchParameters(
      {this.engine,
      this.q,
      this.gl,
      this.hl,
      this.currency,
      this.checkInDate,
      this.checkOutDate,
      this.adults,
      this.children});

  SearchParameters.fromJson(Map<String, dynamic> json) {
    engine = json["engine"];
    q = json["q"];
    gl = json["gl"];
    hl = json["hl"];
    currency = json["currency"];
    checkInDate = json["check_in_date"];
    checkOutDate = json["check_out_date"];
    adults = json["adults"];
    children = json["children"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["engine"] = engine;
    _data["q"] = q;
    _data["gl"] = gl;
    _data["hl"] = hl;
    _data["currency"] = currency;
    _data["check_in_date"] = checkInDate;
    _data["check_out_date"] = checkOutDate;
    _data["adults"] = adults;
    _data["children"] = children;
    return _data;
  }
}

@HiveType(typeId: 15)
class SearchMetadata extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? status;
  @HiveField(2)
  String? jsonEndpoint;
  @HiveField(3)
  String? createdAt;
  @HiveField(4)
  String? processedAt;
  @HiveField(5)
  String? googleHotelsUrl;
  @HiveField(6)
  String? rawHtmlFile;
  @HiveField(7)
  String? prettifyHtmlFile;
  @HiveField(8)
  num? totalTimeTaken;

  SearchMetadata(
      {this.id,
      this.status,
      this.jsonEndpoint,
      this.createdAt,
      this.processedAt,
      this.googleHotelsUrl,
      this.rawHtmlFile,
      this.prettifyHtmlFile,
      this.totalTimeTaken});

  SearchMetadata.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    status = json["status"];
    jsonEndpoint = json["json_endpoint"];
    createdAt = json["created_at"];
    processedAt = json["processed_at"];
    googleHotelsUrl = json["google_hotels_url"];
    rawHtmlFile = json["raw_html_file"];
    prettifyHtmlFile = json["prettify_html_file"];
    totalTimeTaken = json["total_time_taken"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["status"] = status;
    _data["json_endpoint"] = jsonEndpoint;
    _data["created_at"] = createdAt;
    _data["processed_at"] = processedAt;
    _data["google_hotels_url"] = googleHotelsUrl;
    _data["raw_html_file"] = rawHtmlFile;
    _data["prettify_html_file"] = prettifyHtmlFile;
    _data["total_time_taken"] = totalTimeTaken;
    return _data;
  }
}
