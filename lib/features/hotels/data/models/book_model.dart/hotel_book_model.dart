class HotelBookModel {
  final String checkIn;
  final String checkOut;
  final int noRooms;
  final int guest;

  HotelBookModel(
      {required this.checkIn,
      required this.checkOut,
      required this.noRooms,
      required this.guest});
  Map<String, dynamic> toJson() {
    return {
      'checkIn': checkIn,
      'checkOut': checkOut,
      'noRooms': noRooms,
      'guest': guest,
    };
  }

  factory HotelBookModel.fromJson(Map<String, dynamic> json) {
    return HotelBookModel(
      checkIn: json['checkIn'] as String,
      checkOut: json['checkOut'] as String,
      noRooms: json['noRooms'] as int,
      guest: json['guest'] as int,
    );
  }
}
