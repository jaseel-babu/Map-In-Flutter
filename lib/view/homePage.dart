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
      appBar: AppBar(),
      body: GetBuilder<Controller>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ElevatedButton(
              onPressed: () {
                controller.destination = destinationController.text;
             
                Get.to(() => MapScreen());
              },
              child: const Text("Go There"),
            ),
          ],
        );
      }),
    );
  }
}