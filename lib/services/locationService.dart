import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:sample_project/model/model.dart';

class LocationService {
  final String apikey = "AIzaSyBlEEDsJoLqcZDnnQXc2gxj5WUjs-K9qFA";
  //IT IS NOT GET PROPER RESULT BECOUSE THIS NEED BILLING ACCOUNT----------------4

  Future<List<PlaceSearch>> getPlaceId(String search) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$apikey";
    http.Response response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);
    print(json);

    var jsonResult = json['predictions'] as List;
    
    return jsonResult.map(( e ) => PlaceSearch.fromjson(e as Map<String ,dynamic>)).toList();
  }
//   static const String url =
//       'https://maps.googleapis.com/maps/api/directions/json?';
//   Future getDirection(
//     LatLng origin,
//     LatLng destination,
//   ) async {
//     final response = await http.get( 
//       Uri.parse(
//           "${url}+origin:${origin.latitude},${origin.longitude},destination:${destination.latitude},${destination.longitude},key:${apikey}"),
//     );
//     if (response.statusCode == 200) {
//       return Directions.fromMap(response.body as Map<String, dynamic>);
//     }
//     print(
//         "${url}origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=${apikey}");
//     return null;
//   }
}
