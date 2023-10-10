import 'dart:convert';

import 'package:clima_flutter/index.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void printData(decodedData) {
    double latitude = decodedData['coord']['lat'];
    print(latitude);

    double longitude = decodedData['coord']['lon'];
    print(longitude);

    String weatherDescription = decodedData['weather'][0]['description'];
    print(weatherDescription);

    double temparature = decodedData['main']['temp'];
    print(temparature);

    int condition = decodedData['weather'][0]['id'];
    print(condition);

    String cityName = decodedData['name'];
    print(cityName);
  }

  void getData() async {
    var url = Uri.https('samples.openweathermap.org', '/data/2.5/weather', {'lat':'35','lon':'139','appid':'sdfgasdg'});
    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
      String data = response.body;

      printData(jsonDecode(data));

    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
