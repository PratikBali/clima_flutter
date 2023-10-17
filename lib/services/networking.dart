import 'dart:developer';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima_flutter/index.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const apiKey = '5071faa693e4dd9c72496ec72e7e0b84';
const pratikKey = '70f97bb4d6219c5791b21cdb04c0eed4';

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

  Future<dynamic> fetchWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    print('3. fetchWeatherData');
    try {
      Response response = await get(
        Uri.https(
          'api.openweathermap.org',
          '/data/2.5/weather',
          {
            'lat': '${latitude}',
            'lon': '${longitude}',
            'appid': '$apiKey',
            'units': 'metric'
          },
        ),
      );

      print('4. response: ${response.body}');
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        return null;
      }
    } catch (e) {
      print('3. failed $e');
    }

  }
}