import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:my_visitor/features/maps/api.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  LocationData? currentLocation;
  List<LatLng>? routePoints = [LatLng(26.566640, 31.742795)];
  List<Marker> markers = [];
  bool isSatellite = false;
  int tripSeconds = 0;
  double distanceKm = 0;
  double estimatedPrice = 0;

  MapCubit() : super(MapInitial());

  Future<void> getCurrentLocation() async {
    var location = Location();
    try {
      var userLocation = await location.getLocation();
      currentLocation = userLocation;
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(userLocation.latitude!, userLocation.longitude!),
          child: const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
        ),
      );
    } on Exception {
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      currentLocation = newLocation;
      emitLoaded();
    });

    emitLoaded();
  }

  Future<void> getRoute(LatLng destination) async {
    if (currentLocation == null) return;

    final start = LatLng(
      currentLocation!.latitude!,
      currentLocation!.longitude!,
    );
    final response = await http.get(
      Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=${Api.orsApiKey}&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];
      routePoints = coords.map((coord) => LatLng(coord[1], coord[0])).toList();

      // Calculate distance and price (example)
      distanceKm = _calculateDistance(routePoints!);
      estimatedPrice = distanceKm * 10; // Example: 10 EGP per km
      emitLoaded();
    } else {
      throw Exception('Failed to load route');
    }
  }

  void addDestinationMarker(LatLng point) {
    markers.length > 1 ? markers.removeAt(1) : null;
    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: point,
        child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
      ),
    );
    getRoute(point);
  }

  void toggleMapType() {
    isSatellite = !isSatellite;
    emitLoaded();
  }

  void emitLoaded() {
    emit(
      MapLoaded(
        currentLocation: currentLocation,
        routePoints: routePoints!,
        markers: markers,
        tripSeconds: tripSeconds,
        distanceKm: distanceKm,
        estimatedPrice: estimatedPrice,
        isSatellite: isSatellite,
      ),
    );
  }

  double _calculateDistance(List<LatLng> points) {
    double totalDistance = 0;
    for (int i = 0; i < points.length - 1; i++) {
      totalDistance += Distance().as(LengthUnit.Kilometer, points[i], points[i + 1]);
    }
    return totalDistance;
  }
}