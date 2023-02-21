import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/global.color.dart';
import 'newRequest.view.dart';

class RequestScreen extends StatelessWidget {
  double _length = 500;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(35.537096, 6.109608), zoom: 15),
          ),

          Positioned(
            left: 1,
            right: 1,
            bottom: 2,
            child: Container(
              child: InkWell(
                onTap: () => {Get.to(() => NewRequestScreen())},
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
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
          )
        ]),
      ),
    );
  }
}
