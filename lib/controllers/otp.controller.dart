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
  var userEmail = Get.arguments[0];
  final supabase = Supabase.instance.client;
  late TextEditingController otpCode;

  // ----------Dependency Injection----------//

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    otpCode = TextEditingController();
  }

  final signController = Get.put(SignController());
  var box = Hive.box('user');

  // ----------Variables----------//
  bool isAuthenticated = false;
  String? session;
  User? user;

  Future<void> verification() async {
    try {
      final AuthResponse response = await supabase.auth.verifyOTP(
          type: OtpType.signup, token: otpCode.value.text, email: userEmail!);
      session = supabase.auth.currentSession?.accessToken;
      user = response.user;
      session == null ? isAuthenticated = false : isAuthenticated = true;

      box.putAll({
        'id': user?.id,
        'email': user?.email,
        'session': session,
        'isAuth': isAuthenticated
      });

      Get.to(() => UserInfoScreen());
    } catch (e) {
      CustomSnackBar("Error", "try again please", GlobalColor.redColor);
    }
  }
}
