import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/model/credential.model.dart';
import 'package:lgali/signup/TypeUser/type.view.dart';
import 'package:lgali/signup/registration/registration.view.dart';

import 'package:lgali/signup/sing.controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpController extends GetxController {
  // ----------SupaBase----------//
  final supabase = Supabase.instance.client;

  // ----------Dependency Injection----------//
  final data = Get.put(PersonData());
  final signController = Get.put(SignController());

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

      print('_______Session_______');
      print(session);
      data.storage.write('session',session);

      print('_______UserID_______');
      print(user?.id);
      data.storage.write("id", user?.id);

      print('_______UserEmail_______');
      print(user?.email);
      data.storage.write("email", user?.email);

      print('_______IsAuthenticated_______');
      print(isAuthenticated);
      data.storage.write("isAuth",isAuthenticated );

      Get.off(() => TypeUser());
    } catch (err) {
      Get.snackbar("Error", "Token has expired or is invalid",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
    }
  }


}
