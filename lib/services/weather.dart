import 'dart:developer';

import 'package:clima_flutter/index.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class WeatherModel {

  Future<dynamic> getWeatherByCity(cityName, context) async {
    NetworkHelper networkHelper = NetworkHelper();
    var weatherData = await networkHelper.getWeatherByCityApi(cityName);
    if(weatherData == null) {
      Alert(context: context, title: "Oops! Something went wrong", desc: "Please try again").show();
    }
    return weatherData;
  }

  Future<dynamic> getLocationWeather(context) async {
    print('2. getLocationWeather');
    NetworkHelper networkHelper = NetworkHelper();
    var weatherData = await networkHelper.fetchWeatherData();
    if(weatherData == null) {
      Alert(context: context, title: "Oops! Something went wrong", desc: "Please try again").show();
    }
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
