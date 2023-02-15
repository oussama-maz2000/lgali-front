import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  String title = "home Screen";

  var checkGPS = false.obs;

  @override
  void onInit() {
    super.onInit();
    cheaking();
  }

  Future<void> cheaking() async {
    bool servicestatus;
    LocationPermission permission;
    servicestatus = await Geolocator.isLocationServiceEnabled();

    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }
      checkGPS.value = true;
    } else {
      await Geolocator.openLocationSettings();
      if (servicestatus) {
        print('hello world');
      }
    }
    /* if (servicestatus && permission == LocationPermission.always) {
      checkGPS.value = true;
    } */
  }
}
