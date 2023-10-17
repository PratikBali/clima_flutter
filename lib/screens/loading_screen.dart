import 'dart:developer';

import 'package:clima_flutter/index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    print('1. getLocationData');
    var weatherData = await weather.getLocationWeather(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        )
      ),
    );
  }
}
