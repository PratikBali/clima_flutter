import 'package:geolocator/geolocator.dart';

class Location {
  var latitude;
  var longitude;

  Future getCurrentLocation () async {
    LocationPermission permission = await Geolocator.checkPermission();
    List<String> perm = permission.toString().split('.');
    if (perm[1] != 'always') {
      LocationPermission permReq = await Geolocator.requestPermission();
      List<String> req = permReq.toString().split('.');

      if (req[1] == 'always') {
        print('Done');
      }
    }
    print('step 1 - getCurrentLocation()');
    try {
      print('step 1 getting location data');
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print('step 1 location data- $position');
    } catch (e) {
      print('step 1 location data failure');
      print(e);
    }
    print('step 1 return');
  }
}