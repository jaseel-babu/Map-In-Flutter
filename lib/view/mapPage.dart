import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sample_project/controller/controller.dart';
import 'package:sample_project/services/locationService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

final controller = Get.put(Controller());

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _initialCameraPosition = CameraPosition(
      target: LatLng(controller.currentPosition!.latitude,
          controller.currentPosition!.longitude),
      zoom: 11.5);
  @override
  Widget build(BuildContext context) {
    print(controller.destination);
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                LocationService().getPlaceId(controller.destination!);
                print("pressed");
              },
              child: Text("dsf")),
          Expanded(
              child: GoogleMap(initialCameraPosition: _initialCameraPosition)),
        ],
      ),
    );
  }
}
