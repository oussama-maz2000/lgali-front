import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/textFieldCustom.dart';

class ProfilController extends GetxController {
  final supabase = Supabase.instance.client;
  var box = Hive.box('user');
  var fname, lname, email, phone;
  var data = new Map();
  late List<dynamic> values = [].obs;
  @override
  void onInit() async {
    super.onInit();
  }

  List<Widget> displayInfo() {
    return values.map((e) => CustomField(e.toString())).toList();
  }

  Future<void> signOut() async {
    var user = await Hive.openBox('user');
    await user.clear();
    await supabase.auth.signOut();
    Get.offAll(() => LoginScreen());
  }
}
