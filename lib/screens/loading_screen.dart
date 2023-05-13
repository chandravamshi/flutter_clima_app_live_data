import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

import '../services/location.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${location.lattitude}&lon=${location.longitude}&appid=${location.apiKey}');
    var weatherData = await networkHelper.getData();
    pushPage();
  }

  pushPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            child: const Text('Get Location'),
            onPressed: () {
              getLocation();
            }),
      ),
    );
  }
}
