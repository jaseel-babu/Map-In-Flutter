import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const Directions({
   required this.bounds,
     required this.polylinePoints,
 required this.totalDistance,
    required this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
 

    
    final data = Map<String, dynamic>.from(map['routes'][0]as Map);

 
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat']as double, northeast['lng'] as double),
      southwest: LatLng(southwest['lat']as double, southwest['lng']as double),
    );

    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'].toString();
      duration = leg['duration']['text'].toString();
    }

    return Directions(
      bounds: bounds,
      polylinePoints:
          
          PolylinePoints().decodePolyline(data['overview_polyline']['points'].toString()),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}
