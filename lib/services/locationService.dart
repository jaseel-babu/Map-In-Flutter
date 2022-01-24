import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String apikey = "AIzaSyB7lLr25aqhCIO0rN1rl8CgUDDFpZ1U9Qs";
  Future<String> getPlaceId(String search) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$search&inputtype=textquery&key=$apikey";
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);

    var json = convert.jsonDecode(response.body);
    print(json);

    var placeId = json["candidates"][0]["place_id"] as String;
    print(placeId);
    return placeId;
  }
}
