// ignore_for_file: deprecated_member_use

import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  ///(link) in order to link this class to the loading_screen page
  LocationScreen({this.locationWeather});

  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  /// we write this as a definition of an objects so we don't need to write them underneath
  int temperature;
  var condition;
  String city;
  var weatherIcon;
  String cityName;

  /// (link) in order to link the #locationScreen widget with the #locationScreenState widget
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);

    /// note that << print(widget.locationWeather);>> printing the weatherData object from getWeatherData() of weather model in weather.dart page
  }

  /// the following function is to access the particular data from weatherData
  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      city = 'there is an error ';
      print("dlaskndfaslfalsdnaskdabsdba,NUllllllll");
    } else {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      condition = weatherData['weather'][0]['id'];
      weatherIcon = WeatherModel().getWeatherIcon(condition);
      city = weatherData['name'];
      print("islam:    $temperature");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Bg.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await WeatherModel().getWeatherData();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(right: 10.0, left: 10),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDecoration,
                        onChanged: (value) {
                          cityName = value;

                          /// .. (button 2) the user enters the value for the cityName ..
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (typedName != null) {
                        var weatherCityData =
                            await WeatherModel().getCityWeather(typedName);
                        updateUI(weatherCityData);
                      }

                      /// so, once the CityScreen gets push on top of the LocationScreen.. (button 1)
                      /// .. (button 4) but remember this must have a await function because you're don't know when the user gonna type the cityName
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature˚',
                      style: TextStyle(fontSize: 60),
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                      WeatherModel().getMessage(temperature) + ', ' + city,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 25))),
              FlatButton(
                onPressed: () async {
                  city = cityName;
                  var weatherCityData =
                      await WeatherModel().getCityWeather(city);
                  updateUI(weatherCityData);
                  setState(() {});
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
