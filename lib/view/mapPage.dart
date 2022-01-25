import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sample_project/controller/controller.dart';
import 'package:sample_project/model/model.dart';
import 'package:sample_project/services/locationService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

final controller = Get.put(Controller());

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() { origin = Marker(
          markerId:  MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: LatLng(controller.currentPosition!.latitude,
              controller.currentPosition!.longitude),
        );

        destination = null;
    super.initState();
  }

  GoogleMapController? _googleMapController;

  Marker? origin;
  Marker? destination;

  final _initialCameraPosition = CameraPosition(
      target: LatLng(controller.currentPosition!.latitude,
          controller.currentPosition!.longitude),
      zoom: 11.5,);
  @override
  Widget build(BuildContext context) {
    print(controller.destination);
    return Scaffold(
      body:
          GoogleMap(
              markers: {
                if (origin != null) origin!,
                if (destination != null) destination!
              },
              onLongPress: addMarker,
              onMapCreated: (controller) => _googleMapController = controller,
              initialCameraPosition: _initialCameraPosition) ,
         
        
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController!.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: Icon(Icons.center_focus_strong_outlined),
      ),
    );
  }

  addMarker(LatLng position)async {
    
      setState(() {
        destination = Marker(
          markerId:  MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: position,
        );
      });

    }
  
}
