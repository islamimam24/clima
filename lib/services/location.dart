import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentPosition() async {
    try {
      /// <<<from Flutter Package>>>
      /// this suppose to wait for the previous lines to finish execution to complete and then go further next.
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      /// note that print(position); returns Latitude: 30.276915, Longitude: 31.205193 .. so we wanted them separately
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

/// try & catch to avoid the app from crushing
