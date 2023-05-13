import 'package:geolocator/geolocator.dart';

class Location {
  late double lattitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // print(position);
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // print(e);
    }
  }
}
