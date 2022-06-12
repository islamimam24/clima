import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = SpinKitDoubleBounce(
  color: Colors.white,
  size: 50.0,
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override

  /// initial state to run a function once the screen open. (getLocationData)
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    /// we created a function -getLocationWeather()- inside weather.dart file and this is an object from that function.
    var weatherData = await WeatherModel().getWeatherData();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                ///(link) the link from the LocationScreen class to weatherData
                locationWeather: weatherData,
              )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
