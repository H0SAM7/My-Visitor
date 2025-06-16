import 'activity_model.dart';

class Governorate {
  final String name;
  final String description;
  final List<String> touristPlaces;
  final List<Activity> activities;

  Governorate({
    required this.name,
    required this.description,
    required this.touristPlaces,
    required this.activities,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      name: json['name'],
      description: json['description'],
      touristPlaces: List<String>.from(json['tourist_places']),
      activities: (json['activities'] as List)
          .map((e) => Activity.fromJson(e))
          .toList(),
    );
  }
}
