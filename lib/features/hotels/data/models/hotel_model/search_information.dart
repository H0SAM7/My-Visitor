import 'dart:convert';

class SearchInformation {
  int? totalResults;

  SearchInformation({this.totalResults});

  factory SearchInformation.fromMap(Map<String, dynamic> data) {
    return SearchInformation(
      totalResults: data['total_results'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'total_results': totalResults,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchInformation].
  factory SearchInformation.fromJson(String data) {
    return SearchInformation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchInformation] to a JSON string.
  String toJson() => json.encode(toMap());
}
