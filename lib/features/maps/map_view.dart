import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:my_visitor/features/maps/keys.dart';
import 'package:my_visitor/features/maps/map_services.dart';
import 'package:my_visitor/services/api_services.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'MapScreen';
  final double destinationLat;
  final double destinationLng;

  const MapScreen({
    super.key,
    required this.destinationLat,
    required this.destinationLng,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  final MapService mapService = MapService();

  LocationData? currentLocation;
  List<LatLng> routePoints = [];
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _initMap();
  }

  Future<void> _initMap() async {
    currentLocation = await mapService.getCurrentLocation();
    if (currentLocation != null) {
      setState(() {
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            child:
                const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
          ),
        );
      });

      mapService.getLocationStream().listen((newLocation) {
        setState(() {
          currentLocation = newLocation;
        });
      });
    }
  }

  Future<void> _getRoute(LatLng destination) async {
    if (currentLocation == null) return;

    final start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    final queryParameters = {
      'api_key': MapKeys.orsApiKey,
      'start': '${start.longitude},${start.latitude}',
      'end': '${destination.longitude},${destination.latitude}',
    };

    try {
      final response = await ApiServices().getRequest(
        endPoint: MapKeys.endpoint,
        queryParameters: queryParameters,
      );

      final List<dynamic> coords =
          response['features'][0]['geometry']['coordinates'];

      if (coords.isNotEmpty) {
        setState(() {
          routePoints =
              coords.map((coord) => LatLng(coord[1], coord[0])).toList();
          markers.add(
            Marker(
              width: 80.0,
              height: 80.0,
              point: destination,
              child:
                  const Icon(Icons.location_on, color: Colors.red, size: 40.0),
            ),
          );
        });
      } else {
        log('No route found');
        // Handle empty route case (Optional: Show error message)
      }
    } catch (e) {
      log('Failed to fetch route: $e');
      // Handle API error case (Optional: Show error message)
    }
  }

  void _addDestinationMarker(LatLng point) {
    _getRoute(point);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                initialZoom: 15.0,
                onTap: (tapPosition, point) => _addDestinationMarker(point),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: markers),
                if (routePoints.isNotEmpty) // Check if routePoints is not empty
                  PolylineLayer(
                    polylines: [
                      Polyline<LatLng>(
                        points: routePoints,
                        strokeWidth: 4.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentLocation != null) {
            mapController.move(
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              15.0,
            );
          }
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
