import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:my_visitor/features/maps/mina/api.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  LocationData? currentLocation;
  List<LatLng>? routePoints = [LatLng(0, 0)];
  List<Marker> markers = [];
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
    });
    emit(
      MapLoaded(
        currentLocation: currentLocation,
        routePoints: routePoints!,
        markers: markers,
      ),
    );
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
    } else {
      throw Exception('Failed to load route');
    }
    emit(
      MapLoaded(
        currentLocation: currentLocation,
        routePoints: routePoints!,
        markers: markers,
      ),
    );
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
    emit(
      MapLoaded(
        currentLocation: currentLocation,
        routePoints: routePoints!,
        markers: markers,
      ),
    );
  }
}
