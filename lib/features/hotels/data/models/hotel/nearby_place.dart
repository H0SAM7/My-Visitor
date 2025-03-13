import 'dart:convert';

import 'transportation.dart';

class NearbyPlace {
  String? name;
  List<Transportation>? transportations;

  NearbyPlace({this.name, this.transportations});

  factory NearbyPlace.fromMap(Map<String, dynamic> data) => NearbyPlace(
        name: data['name'] as String?,
        transportations: (data['transportations'] as List<dynamic>?)
            ?.map((e) => Transportation.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'transportations': transportations?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NearbyPlace].
  factory NearbyPlace.fromJson(String data) {
    return NearbyPlace.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [NearbyPlace] to a JSON string.
  String toJson() => json.encode(toMap());
}
