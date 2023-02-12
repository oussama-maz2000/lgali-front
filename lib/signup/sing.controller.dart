import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignContoller extends GetxController {
  GlobalKey<FormState> signFormKey = GlobalKey<FormState>();
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

  void checkSign() {
    final isValid = signFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print('from signup');
    print(signFormKey.currentState!);
    print('email : ' + emailController.value.text);
    print('password : ' + passwordController.value.text);
  }
}
