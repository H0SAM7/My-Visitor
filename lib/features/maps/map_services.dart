import 'dart:developer';
import 'package:location/location.dart';

class MapService {
  final Location _location = Location();

  // This method checks if location permission is granted
  Future<bool> _checkPermissions() async {
    PermissionStatus permission = await _location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await _location.requestPermission();
    }
    return permission == PermissionStatus.granted;
  }

  // This method gets the current location once
  Future<LocationData?> getCurrentLocation() async {
    bool hasPermission = await _checkPermissions();
    if (!hasPermission) {
      log('Location permission denied');
      return null;
    }

    try {
      return await _location.getLocation();
    } catch (e) {
      log('Error getting location: $e');
      return null;
    }
  }

  // This method listens to location changes in real-time
  Stream<LocationData> getLocationStream() async* {
    bool hasPermission = await _checkPermissions();
    if (!hasPermission) {
      log('Location permission denied');
      return;
    }

    yield* _location.onLocationChanged;
  }
}
