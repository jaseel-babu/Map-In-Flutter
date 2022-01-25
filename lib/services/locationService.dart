import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:sample_project/model/model.dart';

class LocationService {
  final String apikey = "AIzaSyB7lLr25aqhCIO0rN1rl8CgUDDFpZ1U9Qs";
  //IT IS NOT GET PROPER RESULT BECOUSE THIS NEED BILLING ACCOUNT----------------

  // Future<String> getPlaceId(String search) async {
  //   String url =
  //       "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$search&inputtype=textquery&key=$apikey";
  //   http.Response response = await http.get(Uri.parse(url));
  //   print(response.statusCode);

  //   var json = convert.jsonDecode(response.body);
  //   print(json);

  //   var placeId = json["candidates"][0]["place_id"] as String;
  //   print(placeId);
  //   return placeId;
  // }
  static const String url =
      'https://maps.googleapis.com/maps/api/directions/json?';
  Future getDirection(LatLng origin, LatLng destination,) async {
    final response = await http.get(Uri.parse(   "${url}+origin:${origin.latitude},${origin.longitude},destination:${destination.latitude},${destination.longitude},key:${apikey}")
   ,
      
    );if (response.statusCode == 200) {
      return Directions.fromMap(response.body as Map<String,dynamic>);
    } print( "${url}origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=${apikey}"
    ); return null;
  }
}
