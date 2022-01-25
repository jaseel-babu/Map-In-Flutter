import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sample_project/controller/controller.dart';
import 'package:sample_project/services/locationService.dart';
import 'package:sample_project/view/mapPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController destinationController = TextEditingController();

class _HomePageState extends State<HomePage> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Map Sample"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<Controller>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  hintText: controller.currentPlace,
                  focusedBorder: InputBorder.none,
                  filled: true,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: destinationController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on_outlined),
                  hintText: "Destination",
                  focusedBorder: InputBorder.none,
                  filled: true,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.destination = destinationController.text;

                  Get.to(() => MapScreen());
                  Get.snackbar("Alert", "Long Press For Choose Current location and Destination");
                },
                child: const Text("Go There"),
              ),
            ],
          );
        }),
      ),
    );
  }
}
