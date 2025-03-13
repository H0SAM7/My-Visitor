import 'dart:convert';

class SearchParameters {
  String? engine;
  String? q;
  String? gl;
  String? hl;
  String? currency;
  String? checkInDate;
  String? checkOutDate;
  int? adults;
  int? children;

  SearchParameters({
    this.engine,
    this.q,
    this.gl,
    this.hl,
    this.currency,
    this.checkInDate,
    this.checkOutDate,
    this.adults,
    this.children,
  });

  factory SearchParameters.fromMap(Map<String, dynamic> data) {
    return SearchParameters(
      engine: data['engine'] as String?,
      q: data['q'] as String?,
      gl: data['gl'] as String?,
      hl: data['hl'] as String?,
      currency: data['currency'] as String?,
      checkInDate: data['check_in_date'] as String?,
      checkOutDate: data['check_out_date'] as String?,
      adults: data['adults'] as int?,
      children: data['children'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'engine': engine,
        'q': q,
        'gl': gl,
        'hl': hl,
        'currency': currency,
        'check_in_date': checkInDate,
        'check_out_date': checkOutDate,
        'adults': adults,
        'children': children,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchParameters].
  factory SearchParameters.fromJson(String data) {
    return SearchParameters.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchParameters] to a JSON string.
  String toJson() => json.encode(toMap());
}
