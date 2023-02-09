import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignContoller extends GetxController {
  final GlobalKey<FormState> signFormKey = GlobalKey<FormState>();
  late TextEditingController userController,
      emailController,
      passwordController;
  var user = '';
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    userController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateUserName(String userName) {
    if (userName.length < 6) {
      return "User Name must be more then 6 characters";
    }
    return null;
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
    print(signFormKey.currentState!);
  }
}
