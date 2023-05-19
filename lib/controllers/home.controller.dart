import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/profileRepository.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  // final ProfileRepository _profileRepository = Get.put(ProfileRepository());

  var box = Hive.box('user');

  var myList = Rx([]);
  final supabase = Supabase.instance.client;

  var checkGPS = false.obs;

  @override
  void onInit() async {
    super.onInit;
    listenToChanges();
  }

  @override
  void onReady() {
    super.onReady();
    getCurrentPosition();
  }

  void updateLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    ProfileRepository.updateLocation(
        box.get('id'), position.altitude, position.longitude);
  }

  void listenToChanges() {
    final subscription = supabase
        .from('positions')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", box.get('id'))
        .listen((List<Map<String, dynamic>> event) async {
          final cluster = event[0].remove('cluster');

          myList.value = await supabase
              .from('companies')
              .select('*')
              .eq('cluster', cluster);
        });

    subscription.resume();
  }

  Future<Position?> activeGPS() async {
    bool serviceStatus;
    LocationPermission permission;
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (serviceStatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }
      checkGPS.value = true;
    } else {
      await Geolocator.openLocationSettings();
      if (serviceStatus) {
        print('status actives well');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
}
