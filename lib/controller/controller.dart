import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sample_project/model/model.dart';
import 'package:sample_project/services/locationService.dart';

class Controller extends GetxController {
  Position? currentPosition;
  String? currentPlace;
  String? destination;
  bool waiting = false;
  List<PlaceSearch>? searchResults;
  @override
  void onInit() {
    current();
    super.onInit();
  }

  Future<Position> getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return Geolocator.getCurrentPosition();
  }

  current() async {
    currentPosition = await getCurrentPosition();
    getCurrentPlaceAddress(
      currentPosition!.latitude,
      currentPosition!.longitude,
    );
  }

  searchPlaces(String searchword) async {
    searchResults = await LocationService().getPlaceId(searchword);
    update();
  }

  getCurrentPlaceAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemark = await GeocodingPlatform.instance
          .placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemark[0];

      currentPlace = place.locality;
      update();
    } catch (e) {
      print(e);
    }
  }
}
