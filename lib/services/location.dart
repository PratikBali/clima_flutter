import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;

  Future getCurrentLocation () async {
    // LocationPermission permission = await Geolocator.checkPermission();
    // List<String> perm = permission.toString().split('.');
    // if (perm[1] != 'always') {
    //   LocationPermission permReq = await Geolocator.requestPermission();
    //   List<String> req = permReq.toString().split('.');
    //
    //   if (req[1] == 'always') {
    //     print('Done');
    //   }
    // }
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}