class EgyptData {
  final List<Governorate> governorates;

  EgyptData({required this.governorates});

  factory EgyptData.fromJson(Map<String, dynamic> json) {
    return EgyptData(
      governorates: (json['governorates'] as List)
          .map((e) => Governorate.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'governorates': governorates.map((e) => e.toJson()).toList(),
      };
}

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

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'tourist_places': touristPlaces,
        'activities': activities.map((e) => e.toJson()).toList(),
      };
}

class Activity {
  final String title;
  final String description;
  final List<String> images;
  final Location location;

  Activity({
    required this.title,
    required this.description,
    required this.images,
    required this.location,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images']),
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'images': images,
        'location': location.toJson(),
      };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
