class UserModel {
  final String? name;
  final String email;
  final String? image;
  final String? phoneNumber;

  UserModel( {this.name, required this.email, this.image, this.phoneNumber,});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profileImageUrl': image,
        'phoneNumber': phoneNumber,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String?,
        email: json['email'] as String,
        image: json['profileImageUrl'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
      );
}
