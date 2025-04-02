
class ImageModel {
  final String thumbnail;
  final String originalImage;

  ImageModel({
    required this.thumbnail,
    required this.originalImage,
  });

  // Factory constructor to create an Image from JSON
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      thumbnail: json['thumbnail'] as String,
      originalImage: json['original_image'] as String,
    );
  }

  // Method to convert Image to JSON
  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
      'original_image': originalImage,
    };
  }
}

// image_collection.dart
class ImageCollection {
  final List<ImageModel> images;

  ImageCollection({
    required this.images,
  });

  // Factory constructor to create an ImageCollection from JSON
  factory ImageCollection.fromJson(Map<String, dynamic> json) {
    return ImageCollection(
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert ImageCollection to JSON
  Map<String, dynamic> toJson() {
    return {
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}