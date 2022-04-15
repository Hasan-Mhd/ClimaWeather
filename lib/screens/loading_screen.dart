import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  // Future<void> getData() async {
  //   Response response = await get(
  //     Uri.parse(
  //         'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=a0ec3c7cd04098ae9b2a0ed6ac7984f3'),
  //   );
  //   print(response.body);
  // }

  void getLocation() async {
    await location.determinePosition();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    getLocation();
    return const Scaffold(
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       determinePosition();
        //       getLocation();
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
