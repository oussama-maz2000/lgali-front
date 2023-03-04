import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lgali/model/repository/profileRepository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final ProfileRepository _profileRepository = Get.put(ProfileRepository());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final myList = Rx([]);
  final supabase = Supabase.instance.client;

  var checkGPS = false.obs;

  @override
  void onInit() {
    super.onInit;
    listenToChanges();
  }

  void updateLocation() async{
    activeGPS().then((value) => print(value));
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
   // _profileRepository.updateLocation(41.8387234, 6.9999999);
    refreshController.refreshCompleted();
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
