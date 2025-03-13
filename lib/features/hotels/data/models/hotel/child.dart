import 'dart:convert';

class Child {
  int? id;
  String? name;

  Child({this.id, this.name});

  factory Child.fromMap(Map<String, dynamic> data) => Child(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Child].
  factory Child.fromJson(String data) {
    return Child.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Child] to a JSON string.
  String toJson() => json.encode(toMap());
}
