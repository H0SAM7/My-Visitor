// ignore_for_file: must_be_immutable

part of 'map_cubit.dart';

sealed class MapState  {
  LocationData? currentLocation;
  List<LatLng> routePoints;
  List<Marker> markers;
  MapState({
    required this.currentLocation,
    required this.routePoints,
    required this.markers,
  });

}

final class MapInitial extends MapState {
  MapInitial() : super(currentLocation: null, routePoints: [], markers: []);
}

final class MapLoaded extends MapState {
  MapLoaded({
    required super.currentLocation,
    required super.routePoints,
    required super.markers,
  });
}
