import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceSearch {
  String? description;
  String? placeid;
  PlaceSearch({
     this.description,
     this.placeid,
  });
  factory PlaceSearch.fromjson(Map<String, dynamic> json) {
    return PlaceSearch(description:  json["description"].toString(),placeid:  json["place_id"].toString()

       );
  }
}


