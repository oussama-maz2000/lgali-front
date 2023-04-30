import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:lgali/screens/stepper.view.dart';

import 'package:lgali/controllers/sing.controller.dart';
import 'package:lgali/screens/stepper/user_info.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../shared/custom_snack_bar.dart';
import '../shared/global.color.dart';

class OtpController extends GetxController {
  // ----------SupaBase----------//
  var userEmail = Get.arguments;
  final supabase = Supabase.instance.client;
  // ----------Dependency Injection----------//

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(userEmail);
  }

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
          token: otpCode.value.text, type: OtpType.signup, email: userEmail);
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

      Get.off(() => UserInfoScreen());
    } catch (err) {
      print(err);
      CustomSnackBar(
          'Error', 'Token has expired or is invalid', GlobalColor.redColor);
    }
  }

  void printOtp() {
    print(otpCode.value.text);
  }
}
