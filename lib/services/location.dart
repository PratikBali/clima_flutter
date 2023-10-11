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
    print('getCurrentLocation');
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}