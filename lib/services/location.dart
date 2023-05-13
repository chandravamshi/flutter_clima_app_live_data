import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  String apiKey = '';
  late double lattitude;
  late double longitude;
  late http.Response response;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // print(position);
      lattitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      // print(e);
    }
  }
}
