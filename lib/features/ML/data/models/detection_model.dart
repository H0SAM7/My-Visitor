import 'package:hive/hive.dart';

part 'detection_model.g.dart';

@HiveType(typeId: 80)
class DetectionModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String aboutMe;

  DetectionModel({
    required this.name,
    required this.aboutMe,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'aboutMe': aboutMe,
      'id': id,
    };
  }

  factory DetectionModel.fromJson(Map<String, dynamic> json) {
    return DetectionModel(
      name: json['name'] as String,
      aboutMe: json['aboutMe'] as String,
      id: json['id'] as int,
    );
  }
}
