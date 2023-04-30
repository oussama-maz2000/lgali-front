import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/profileRepository.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilController extends GetxController {
  final supabase = Supabase.instance.client;

  final ProfileRepository _profileRepository =
      Get.put(ProfileRepository(), permanent: false);

  var box = Hive.box('user');

  final values = Rx([]);
  final type = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    var data = await _profileRepository.fetchUser(box.get('id'));
    values.value = data;
    type.value = values.value[8];
  }

  Future<void> signOut() async {
    var user = await Hive.openBox('user');
    await user.clear();
    await supabase.auth.signOut();
    Get.offAll(() => LoginScreen());
  }
}
