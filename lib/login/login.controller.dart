import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String emailClient) {
    if (!GetUtils.isEmail(emailClient)) {
      return "Provide valid email";
    }
    return null;
  }

  String? validatePassword(String passwordClient) {
    if (passwordClient.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin() {
    print(passwordController.value.text);
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print('from login');
    print(loginFormKey.currentState);
    print('email : ' + emailController.value.text);
    print('password : ' + passwordController.value.text);
  }
}
