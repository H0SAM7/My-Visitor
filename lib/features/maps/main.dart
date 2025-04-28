import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_visitor/constants.dart';
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
  final double latitude;
  final double longitude;
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit()..getCurrentLocation(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Go to Trip', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            if (state.currentLocation == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      state.currentLocation!.latitude!,
                      state.currentLocation!.longitude!,
                    ),
                    initialZoom: 15,
                    onTap: (tapPosition, point) {
                      context.read<MapCubit>().addDestinationMarker(point);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: state.isSatellite
                          ? "https://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}"
                          : "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: state.isSatellite ? const ['mt0', 'mt1', 'mt2', 'mt3'] : const ['a', 'b', 'c'],
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
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _infoTile('⏱️ Time', '${state.tripSeconds} Sec'),
                            _infoTile('🛣️ Distance', '${state.distanceKm.toStringAsFixed(2)} Km'),
                          
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: 'centerLocation',
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
                  backgroundColor: orangeColor,
                  child: const Icon(Icons.my_location,color: Colors.white,),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  heroTag: 'changeMap',
                  onPressed: () => context.read<MapCubit>().toggleMapType(),
                  backgroundColor: orangeColor,
                  child: const Icon(Icons.map,color: Colors.white,),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}