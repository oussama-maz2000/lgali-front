import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/profileRepository.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:lgali/screens/stepper.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/textFieldCustom.dart';

class ProfilController extends GetxController {
  final supabase = Supabase.instance.client;
  final ProfileRepository _profileRepository = Get.put(ProfileRepository());
  var box = Hive.box('user');

  final values = Rx([]);
  late List<dynamic> val = [
    'oussama',
    'mazeghrane',
    '0673719025',
    'loulououssama2015@gmail.com',
    'oussama',
    'mazeghrane',
    '0673719025',
    'loulououssama2015@gmail.com'
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    var data = await _profileRepository.fetchUser(box.get('id'));
    values.value = data;
    print(values.value);
  }

  Future<void> signOut() async {
    var user = await Hive.openBox('user');
    await user.clear();
    await supabase.auth.signOut();
    Get.offAll(() => LoginScreen());
  }
}
