// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_visitor/features/maps/cubit/map_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(latitude: 26.566640, longitude: 31.742795),
    );
  }
}

class MapScreen extends StatelessWidget {
  MapScreen({super.key, required this.latitude, required this.longitude});
  double latitude;
  double longitude;
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('OpenStreetMap with Flutter')),
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            context.read<MapCubit>().getCurrentLocation();
            return state.currentLocation == null
                ? const Center(child: CircularProgressIndicator())
                : FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      state.currentLocation!.latitude!,
                      state.currentLocation!.longitude!,
                    ),
                    initialZoom: 15.0,
                    onTap:
                        (tapPosition, point) => context
                            .read<MapCubit>()
                            .addDestinationMarker(point),
                    onMapReady:
                        () => context.read<MapCubit>().addDestinationMarker(
                          LatLng(latitude, longitude),
                        ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(markers: state.markers),
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: state.routePoints,
                          strokeWidth: 4.0,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                );
          },
        ),
        floatingActionButton: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                if (state.currentLocation != null) {
                  mapController.move(
                    LatLng(
                      state.currentLocation!.latitude!,
                      state.currentLocation!.longitude!,
                    ),
                    15.0,
                  );
                }
              },
              child: const Icon(Icons.my_location),
            );
          },
        ),
      ),
    );
  }
}
