import 'package:clima_flutter/index.dart';

class WeatherModel {

  Future<dynamic> getWeatherByCity(cityName) async {
    print('step 6: getWeatherByCity from WeatherModel');
    try {
      NetworkHelper networkHelper = NetworkHelper();
      var weatherData = await networkHelper.getWeatherByCityApi(cityName);
      print('step 6 : return weather city success');
      return weatherData;
    } catch (e) {
      print('step 6 : weather city failure');
      print(e);
    }
    print('step 6: return failed getWeatherByCity');
  }

  Future<dynamic> getLocationWeather() async {
    print('step 1 : getLocationWeather');
    try {
      NetworkHelper networkHelper = NetworkHelper();
      var weatherData = await networkHelper.getWeatherData();
      print('step 2 : weather data success');
      return weatherData;
    } catch (e) {
      print('step 2 : weather data failure');
      print(e);
    }
    print('step 2 failure');
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
