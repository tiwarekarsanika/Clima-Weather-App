import 'package:flutter/material.dart';
import '../screens/loading_page.dart';
import '../screens/loading_page.dart';
import 'networking_data.dart';
import '../functions/get_location.dart';

const apiKey = '18bf39b168924283e70fbc3031234bbd';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkData networkHelper = NetworkData(
        url: 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future <dynamic> getLocationWeather() async {
    getLocation Location = new getLocation();
    await Location.location();

    NetworkData networking = NetworkData(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${Location.latitude}&lon=${Location.latitude}&appid=${apiKey}&units=metric');

    // 'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22&units=metric'

    var weatherData = await networking.getData();
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

  String getWeatherName(int condition) {
    if (condition < 300) {
      return 'Thunder';
    } else if (condition < 400) {
      return 'Raining';
    } else if (condition < 600) {
      return 'Drizzle';
    } else if (condition < 700) {
      return 'Snowy';
    } else if (condition < 800) {
      return 'Windy';
    } else if (condition == 800) {
      return 'Sunny';
    } else if (condition <= 804) {
      return 'Cloudy';
    } else {
      return 'Error';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
