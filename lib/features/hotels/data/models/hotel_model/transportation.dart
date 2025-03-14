import 'dart:convert';

class Transportation {
  String? type;
  String? duration;

  Transportation({this.type, this.duration});

  factory Transportation.fromMap(Map<String, dynamic> data) {
    return Transportation(
      type: data['type'] as String?,
      duration: data['duration'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'type': type,
        'duration': duration,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Transportation].
  factory Transportation.fromJson(String data) {
    return Transportation.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Transportation] to a JSON string.
  String toJson() => json.encode(toMap());
}
