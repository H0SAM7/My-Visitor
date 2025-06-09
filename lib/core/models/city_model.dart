import 'package:hive/hive.dart';

part 'city_model.g.dart';

@HiveType(typeId: 70)
class CityModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final List<String> touristPlaces;

  @HiveField(3)
  final List<Activity> activities;

  CityModel({
    required this.name,
    required this.description,
    required this.touristPlaces,
    required this.activities,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        name: json['name'],
        description: json['description'],
        touristPlaces: List<String>.from(json['tourist_places']),
        activities: (json['activities'] as List)
            .map((e) => Activity.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'tourist_places': touristPlaces,
        'activities': activities.map((e) => e.toJson()).toList(),
      };
}

@HiveType(typeId: 71)
class Activity extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final List<String> images;

  @HiveField(3)
  final Location location;

  Activity({
    required this.title,
    required this.description,
    required this.images,
    required this.location,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        title: json['title'],
        description: json['description'],
        images: List<String>.from(json['images']),
        location: Location.fromJson(json['location']),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'images': images,
        'location': location.toJson(),
      };
}

@HiveType(typeId: 72)
class Location extends HiveObject {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json['latitude'],
        longitude: json['longitude'],
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
