import 'package:http/http.dart';
import 'dart:convert';

const apiKey = '42225aea6b7b5f5b662dbe342fa8f19b';

class NetworkHelper {
  NetworkHelper(this.latitude, this.longitude);
  var latitude;
  var longitude;

  Future getWeatherData() async {
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
      print('statusCode:${response.statusCode}');
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('statusCode:${response.statusCode}');
    }
  }
}