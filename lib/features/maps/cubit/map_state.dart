part of 'map_cubit.dart';

sealed class MapState {
  LocationData? currentLocation;
  List<LatLng> routePoints;
  List<Marker> markers;
  int tripSeconds;
  double distanceKm;
  double estimatedPrice;
  bool isSatellite;

  MapState({
    required this.currentLocation,
    required this.routePoints,
    required this.markers,
    required this.tripSeconds,
    required this.distanceKm,
    required this.estimatedPrice,
    required this.isSatellite,
  });
}

final class MapInitial extends MapState {
  MapInitial()
      : super(
          currentLocation: null,
          routePoints: [],
          markers: [],
          tripSeconds: 0,
          distanceKm: 0,
          estimatedPrice: 0,
          isSatellite: false,
        );
}

final class MapLoaded extends MapState {
  MapLoaded({
    required super.currentLocation,
    required super.routePoints,
    required super.markers,
    required super.tripSeconds,
    required super.distanceKm,
    required super.estimatedPrice,
    required super.isSatellite,
  });
}