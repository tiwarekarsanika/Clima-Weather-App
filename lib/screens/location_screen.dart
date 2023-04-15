import 'package:flutter/material.dart';
import '../functions/result.dart';
import '../functions/networking_data.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initSate() {
    super.initState();
    updateUI(widget.weatherData);
  }

  int? temp;
  int? id;
  String? city;
  String? weatherIcon;
  String? weatherName;
  String? weatherMsg;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weatherIcon = 'Error';
        weatherMsg = 'Unable to get weather data.';
        city = '';
        return;
      } else {
        double t = weatherData['main']['temp'];
        temp = t.toInt();
        id = weatherData['weather'][0]['id'];
        city = weatherData['name'];

        weatherIcon = weather.getWeatherIcon(id!);
        weatherName = weather.getWeatherName(id!);
        weatherMsg = weather.getMessage(temp!);
      }
    });
  }

  // Future<String> getData() {
  //   return Future.delayed(Duration(seconds: 2), () {
  //     return "I am data";
  //     // throw Exception("Custom Error");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade800,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              TextButton(
                onPressed: () async {
                  var weatherData = await weather.getLocationWeather();
                  updateUI(weatherData);
                },
                child: Icon(
                  Icons.near_me,
                  size: 50.0,
                ),
              ),
              TextButton(
                onPressed: () async {
                  var typedName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CityScreen();
                      },
                    ),
                  );
                  if (typedName != null) {
                    var weatherData =
                        await weather.getCityWeather(typedName);
                    updateUI(weatherData);
                  }
                },
                child: Icon(
                  Icons.location_city,
                  size: 50.0,
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    temp.toString(),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          weatherIcon ?? 'Error',
                          style: const TextStyle(
                            fontSize: 60,
                          ),
                        ),
                        Text(
                          weatherName ?? 'Error',
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${weatherMsg} in ${city}",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
