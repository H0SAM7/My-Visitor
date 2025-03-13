import 'dart:convert';

class SearchMetadata {
  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? googleHotelsUrl;
  String? rawHtmlFile;
  String? prettifyHtmlFile;
  double? totalTimeTaken;

  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleHotelsUrl,
    this.rawHtmlFile,
    this.prettifyHtmlFile,
    this.totalTimeTaken,
  });

  factory SearchMetadata.fromMap(Map<String, dynamic> data) {
    return SearchMetadata(
      id: data['id'] as String?,
      status: data['status'] as String?,
      jsonEndpoint: data['json_endpoint'] as String?,
      createdAt: data['created_at'] as String?,
      processedAt: data['processed_at'] as String?,
      googleHotelsUrl: data['google_hotels_url'] as String?,
      rawHtmlFile: data['raw_html_file'] as String?,
      prettifyHtmlFile: data['prettify_html_file'] as String?,
      totalTimeTaken: (data['total_time_taken'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'status': status,
        'json_endpoint': jsonEndpoint,
        'created_at': createdAt,
        'processed_at': processedAt,
        'google_hotels_url': googleHotelsUrl,
        'raw_html_file': rawHtmlFile,
        'prettify_html_file': prettifyHtmlFile,
        'total_time_taken': totalTimeTaken,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchMetadata].
  factory SearchMetadata.fromJson(String data) {
    return SearchMetadata.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchMetadata] to a JSON string.
  String toJson() => json.encode(toMap());
}
