import 'dart:convert';

class RatePerNight {
  String? lowest;
  int? extractedLowest;
  String? beforeTaxesFees;
  int? extractedBeforeTaxesFees;

  RatePerNight({
    this.lowest,
    this.extractedLowest,
    this.beforeTaxesFees,
    this.extractedBeforeTaxesFees,
  });

  factory RatePerNight.fromMap(Map<String, dynamic> data) => RatePerNight(
        lowest: data['lowest'] as String?,
        extractedLowest: data['extracted_lowest'] as int?,
        beforeTaxesFees: data['before_taxes_fees'] as String?,
        extractedBeforeTaxesFees: data['extracted_before_taxes_fees'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'lowest': lowest,
        'extracted_lowest': extractedLowest,
        'before_taxes_fees': beforeTaxesFees,
        'extracted_before_taxes_fees': extractedBeforeTaxesFees,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RatePerNight].
  factory RatePerNight.fromJson(String data) {
    return RatePerNight.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RatePerNight] to a JSON string.
  String toJson() => json.encode(toMap());
}
