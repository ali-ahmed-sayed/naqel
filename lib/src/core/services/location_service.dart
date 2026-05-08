import 'package:geolocator/geolocator.dart';

import '../utils/utils.dart';

class LocationService {
  LocationService._();
  static final LocationService instance = LocationService._();

  FutureEither<LocationPermission> checkPermission() async {
    return runTask(() => Geolocator.checkPermission());
  }

  FutureEither<LocationPermission> requestPermission() async {
    return runTask(() => Geolocator.requestPermission());
  }

  FutureEither<bool> isLocationServiceEnabled() async {
    return runTask(() => Geolocator.isLocationServiceEnabled());
  }

  FutureEither<bool> openLocationSettings() async {
    return runTask(() => Geolocator.openLocationSettings());
  }

  FutureEither<Position> getCurrentPosition({
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) async {
    return runTask(() async {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
      }

      return await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: accuracy),
      );
    });
  }

  FutureEither<Position?> getLastKnownPosition() async {
    return runTask(() => Geolocator.getLastKnownPosition());
  }

  Stream<Position> getPositionStream({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 0,
  }) {
    return Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    );
  }
}
