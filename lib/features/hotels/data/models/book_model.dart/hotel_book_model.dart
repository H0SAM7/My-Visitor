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
}
