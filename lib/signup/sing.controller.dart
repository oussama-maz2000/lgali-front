import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/model/credential.model.dart';
import 'package:lgali/model/user.model.dart';
import 'package:lgali/signup/Otp/otp.view.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignController extends GetxController {
  final supabase = Supabase.instance.client;
  var emailValid = false.obs;
  var passwordValid = false.obs;
  var passwordController = TextEditingController();
  var emailController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> isValid() async {
    if (!emailValid.value || !passwordValid.value) {
      Get.snackbar("Error", "Email or Password invalid",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
    } else if (emailValid.value && passwordValid.value) {
      final AuthResponse response = await supabase.auth.signUp(
          password: passwordController.value.text,
          email: emailController.value.text);

      Get.to(() => OtpView());
    }
  }
}
