import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:lgali/screens/stepper.view.dart';

import 'package:lgali/controllers/sing.controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpController extends GetxController {
  // ----------SupaBase----------//

  final supabase = Supabase.instance.client;
  // ----------Dependency Injection----------//

  final signController = Get.put(SignController());
  var box = Hive.box('user');

  // ----------Variables----------//
  TextEditingController otpCode = TextEditingController();
  bool isAuthenticated = false;
  String? session;
  User? user;

  Future<void> verification() async {
    try {
      final AuthResponse response = await supabase.auth.verifyOTP(
          token: otpCode.value.text,
          type: OtpType.signup,
          email: signController.emailController.value.text);
      session = supabase.auth.currentSession?.accessToken;
      user = response.user;
      session == null ? isAuthenticated = false : isAuthenticated = true;

      print('_______Data User_______');
      box.putAll({
        'id': user?.id,
        'email': user?.email,
        'session': session,
        'isAuth': isAuthenticated
      });
      print(box.get('id'));
      print(box.get('email'));
      print(box.get('session'));
      print(box.get('isAuth'));

      Get.off(() => StepperScreen());
    } catch (err) {
      Get.snackbar("Error", "Token has expired or is invalid",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
