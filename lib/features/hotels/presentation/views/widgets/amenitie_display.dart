import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AmenityIconProvider {
  final Map<String, IconData> _amenityIconMap = {
    "Breakfast (\$)": FontAwesomeIcons.utensils,
    "Breakfast": FontAwesomeIcons.utensils, // Same as Breakfast ($)
    "Free breakfast": FontAwesomeIcons.utensils, // Same as Breakfast
    "Free Wi-Fi": FontAwesomeIcons.wifi,
    "Free parking": FontAwesomeIcons.parking,
    "Pools": FontAwesomeIcons.waterLadder,
    "Outdoor pool": FontAwesomeIcons.waterLadder, // Same as Pools
    "Indoor pool": FontAwesomeIcons.waterLadder, // Same as Pools
    "Hot tub": FontAwesomeIcons.hotTubPerson,
    "Air conditioning": FontAwesomeIcons.wind,
    "Fitness centre": FontAwesomeIcons.dumbbell,
    "Spa": FontAwesomeIcons.spa,
    "Beach access": FontAwesomeIcons.umbrellaBeach,
    "Bar": FontAwesomeIcons.martiniGlass,
    "Restaurant": FontAwesomeIcons.utensils,
    "Room service": FontAwesomeIcons.bellConcierge,
    "Airport shuttle": FontAwesomeIcons.shuttleVan,
    "Full-service laundry": FontAwesomeIcons.soap,
    "Accessible": FontAwesomeIcons.wheelchair,
    "Wheelchair accessible": FontAwesomeIcons.wheelchair, // Same as Accessible
    "Business centre": FontAwesomeIcons.briefcase,
    "Child-friendly": FontAwesomeIcons.baby,
    "Kid-friendly": FontAwesomeIcons.baby, // Same as Child-friendly
    "Smoke-free property": FontAwesomeIcons.banSmoking,
    "Smoke-free": FontAwesomeIcons.banSmoking, // Same as Smoke-free property
    "Crib": FontAwesomeIcons.babyCarriage,
    "Ironing board": FontAwesomeIcons.shirt, // Closest match for ironing
    "Pet-friendly": FontAwesomeIcons.dog,
    "Washer":
        FontAwesomeIcons.soap, // Same as laundry, or use a washing machine icon
    "Kitchen": FontAwesomeIcons.kitchenSet,
    "Kitchen in rooms": FontAwesomeIcons.kitchenSet, // Same as Kitchen
    "Kitchen in some rooms": FontAwesomeIcons.kitchenSet, // Same as Kitchen
    "Oven stove": FontAwesomeIcons.fireBurner, // Closest match for stove
    "Patio": FontAwesomeIcons.chair, // Representing outdoor seating
    "Cable TV": FontAwesomeIcons.tv,
    "Golf": FontAwesomeIcons.golfBallTee,
  };

  IconData getIcon(String amenity) {
    return _amenityIconMap[amenity] ?? FontAwesomeIcons.circleQuestion;
  }
}
