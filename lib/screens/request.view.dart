import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/global.color.dart';
import 'newRequest.view.dart';

class RequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width-20,
                height: MediaQuery.of(context).size.height-160,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(35.5359269,  6.1011878), zoom: 14),
                  mapType: MapType.normal,
                  myLocationEnabled: true,

                  markers: {
                    Marker(
                        markerId: MarkerId('demi'),
                        position: LatLng(35.5359269,  6.1011878))
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: InkWell(
                onTap: () => {Get.to(() => NewRequestScreen())},
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    color: GlobalColor.buttonColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Create Request',
                    style: TextStyle(
                        color: GlobalColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 23),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
