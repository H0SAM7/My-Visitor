import 'dart:convert';

class GpsCoordinates {
  double? latitude;
  double? longitude;

  GpsCoordinates({this.latitude, this.longitude});

  factory GpsCoordinates.fromMap(Map<String, dynamic> data) {
    return GpsCoordinates(
      latitude: (data['latitude'] as num?)?.toDouble(),
      longitude: (data['longitude'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'latitude': latitude,
        'longitude': longitude,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GpsCoordinates].
  factory GpsCoordinates.fromJson(String data) {
    return GpsCoordinates.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GpsCoordinates] to a JSON string.
  String toJson() => json.encode(toMap());
}
