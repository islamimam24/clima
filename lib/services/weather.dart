// ignore_for_file: unused_import

import 'package:flutter/services.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const weatherMap = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = '19152ead3e1bf1d4415cf59063357ff9';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper cityUrl =
        NetworkHelper('$weatherMap?q=$cityName&appid=$apiKey&units=metric');

    var cityWeather = cityUrl.getJsonDecodeData();

    return cityWeather;
  }

  Future<dynamic> getWeatherData() async {
    /// creating an object from the Location class.
    Location location = Location();
    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper(
        '$weatherMap?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getJsonDecodeData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s IceCream time';
    } else if (temp > 20) {
      return 'Time for shorts and T-shirts';
    } else if (temp < 10) {
      return 'You\'ll need a Scarf and gloves';
    } else {
      return 'Bring a Jacket just in case';
    }
  }
}
