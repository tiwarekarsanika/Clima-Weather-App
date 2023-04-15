import 'package:clima_weather/functions/result.dart';
import 'package:flutter/material.dart';
import '../functions/get_location.dart';
import '../functions/networking_data.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class loadingScreen extends StatefulWidget {
  @override
  State<loadingScreen> createState() => loadingScreenState();
}

class loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrPosition();
  }

  void getCurrPosition() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.cyan,
            size: 80.0,
          ),
        ),
      ),
    );
  }
}
