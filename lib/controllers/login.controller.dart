import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/dashbord.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/storage.dart';
import '../utils/global.color.dart';

class LoginController extends GetxController {
  final data = Get.put(Data());

  final supabase = Supabase.instance.client;

  late TextEditingController emailController, passwordController;
  var emailValid;

  var passwordValid;

  String? session;
  User? user;
  bool isAuthenticated = false;

  @override
  void onInit() {
    super.onInit();
    emailValid = false.obs;
    passwordValid = false.obs;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> logInWithPassword() async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
          password: passwordController.value.text,
          email: emailController.value.text);
      user = response.user;
      session = supabase.auth.currentSession?.accessToken;
      session == null ? isAuthenticated = false : isAuthenticated = true;

      print('_______Session_______');
      print(session);
      data.storage.write('session', session);

      print('_______UserID_______');
      print(user?.id);
      data.storage.write("id", user?.id);

      print('_______UserEmail_______');
      print(user?.email);
      data.storage.write("email", user?.email);

      print('_______IsAuthenticated_______');
      print(isAuthenticated);
      data.storage.write("isAuth", isAuthenticated);
      Get.snackbar("Logged in", "Welcome in your account ",
          backgroundColor: GlobalColor.greenColor,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(() => DashBordScreen());
    } catch (e) {
      Get.snackbar("Error", "Incorrect email or password",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
