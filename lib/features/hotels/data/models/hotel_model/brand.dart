import 'dart:convert';

import 'child.dart';

class Brand {
  int? id;
  String? name;
  List<Child>? children;

  Brand({this.id, this.name, this.children});

  factory Brand.fromMap(Map<String, dynamic> data) => Brand(
        id: data['id'] as int?,
        name: data['name'] as String?,
        children: (data['children'] as List<dynamic>?)
            ?.map((e) => Child.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'children': children?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Brand].
  factory Brand.fromJson(String data) {
    return Brand.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Brand] to a JSON string.
  String toJson() => json.encode(toMap());
}
