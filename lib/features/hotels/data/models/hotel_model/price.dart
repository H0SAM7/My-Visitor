import 'dart:convert';

import 'rate_per_night.dart';

class Price {
  String? source;
  String? logo;
  int? numGuests;
  RatePerNight? ratePerNight;

  Price({this.source, this.logo, this.numGuests, this.ratePerNight});

  factory Price.fromMap(Map<String, dynamic> data) => Price(
        source: data['source'] as String?,
        logo: data['logo'] as String?,
        numGuests: data['num_guests'] as int?,
        ratePerNight: data['rate_per_night'] == null
            ? null
            : RatePerNight.fromMap(
                data['rate_per_night'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'source': source,
        'logo': logo,
        'num_guests': numGuests,
        'rate_per_night': ratePerNight?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Price].
  factory Price.fromJson(String data) {
    return Price.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Price] to a JSON string.
  String toJson() => json.encode(toMap());
}
