import 'dart:convert';

class SerpapiPagination {
  int? currentFrom;
  int? currentTo;
  String? nextPageToken;
  String? next;

  SerpapiPagination({
    this.currentFrom,
    this.currentTo,
    this.nextPageToken,
    this.next,
  });

  factory SerpapiPagination.fromMap(Map<String, dynamic> data) {
    return SerpapiPagination(
      currentFrom: data['current_from'] as int?,
      currentTo: data['current_to'] as int?,
      nextPageToken: data['next_page_token'] as String?,
      next: data['next'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'current_from': currentFrom,
        'current_to': currentTo,
        'next_page_token': nextPageToken,
        'next': next,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SerpapiPagination].
  factory SerpapiPagination.fromJson(String data) {
    return SerpapiPagination.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SerpapiPagination] to a JSON string.
  String toJson() => json.encode(toMap());
}
