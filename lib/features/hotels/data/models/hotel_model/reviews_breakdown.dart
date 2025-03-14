import 'dart:convert';

class ReviewsBreakdown {
  String? name;
  String? description;
  int? totalMentioned;
  int? positive;
  int? negative;
  int? neutral;

  ReviewsBreakdown({
    this.name,
    this.description,
    this.totalMentioned,
    this.positive,
    this.negative,
    this.neutral,
  });

  factory ReviewsBreakdown.fromMap(Map<String, dynamic> data) {
    return ReviewsBreakdown(
      name: data['name'] as String?,
      description: data['description'] as String?,
      totalMentioned: data['total_mentioned'] as int?,
      positive: data['positive'] as int?,
      negative: data['negative'] as int?,
      neutral: data['neutral'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'total_mentioned': totalMentioned,
        'positive': positive,
        'negative': negative,
        'neutral': neutral,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReviewsBreakdown].
  factory ReviewsBreakdown.fromJson(String data) {
    return ReviewsBreakdown.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReviewsBreakdown] to a JSON string.
  String toJson() => json.encode(toMap());
}
