import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lgali/model/storage.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  final data=Get.put(Data());
  String title = "home Screen";

  var checkGPS = false.obs;

  @override
  void onInit() {
    super.onInit();
    print(data.storage.read('id'));
    print(data.storage.read('isAuth'));
    print(data.storage.read('session'));
    print(data.storage.read('user'));
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
