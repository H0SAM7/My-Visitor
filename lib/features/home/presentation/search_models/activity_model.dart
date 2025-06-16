class Activity {
  final String title;
  final String description;
  final List<String> images;
  final String location;

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
      location: json['location'] ?? '',
    );
  }
}
