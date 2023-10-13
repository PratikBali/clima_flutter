import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima_flutter/index.dart';
import 'package:clima_flutter/index.dart';

const apiKey = '42225aea6b7b5f5b662dbe342fa8f19b';

class NetworkHelper {
  NetworkHelper();
  var latitude;
  var longitude;

  Future<dynamic> getWeatherByCityApi(cityName) async {

    Response response = await get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'q': '${cityName}',
          'appid': '$apiKey',
          'units': 'metric'
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return null;
    }
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;

    Response response = await get(
      Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': '${latitude}',
          'lon': '${longitude}',
          'appid': '$apiKey',
          'units': 'metric'
          //'b6907d289e10d714a6e88b30761fae22'
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return null;
    }
  }
}