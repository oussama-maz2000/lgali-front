import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/otp.view.dart';
import 'package:lgali/shared/custom_snack_bar.dart';
import 'package:lgali/shared/global.color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../screens/otp_test_view.dart';

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

  Future<void> registerEmailPassword() async {
    try {
      if (emailValid.value && passwordValid.value) {
        await supabase.auth.signUp(
            password: passwordController.value.text,
            email: emailController.value.text);
        CustomSnackBar(
            'Register', 'you will get opt code', GlobalColor.greenColor);
        Get.to(() => OtpTest(), arguments: [emailController.value.text]);
      } else if (!emailValid.value || !passwordValid.value)
        CustomSnackBar(
            'Error', 'invalid email or password', GlobalColor.redColor);
    } catch (e) {
      CustomSnackBar(
          'Error', 'you have registered before', GlobalColor.redColor);
    }
  }
}
