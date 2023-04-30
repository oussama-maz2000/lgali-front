import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lgali/model/repository/profileRepository.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  // final ProfileRepository _profileRepository = Get.put(ProfileRepository());
  var repository = Get.lazyPut(() => ProfileRepository());
  var _profileRepository = Get.find<ProfileRepository>();

  final myList = Rx([]);
  final supabase = Supabase.instance.client;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var checkGPS = false.obs;

  @override
  void onInit() {
    super.onInit;
    listenToChanges();

    //await activeGPS();
  }

  void updateLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    _profileRepository.updateLocation(latitude.value, longitude.value);
  }

  void listenToChanges() {
    final subscription = supabase
        .from('userPlace')
        .stream(primaryKey: ['user_id'])
        .eq("user_id", "48b1256c-0da0-4e34-a09c-d1dd5ae93fe0")
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
}
