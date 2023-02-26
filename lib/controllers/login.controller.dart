import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/profile_repository.dart';
import 'package:lgali/screens/dashbord.view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/global.color.dart';

class LoginController extends GetxController {
  final supabase = Supabase.instance.client;
  final ProfileRepository _profileRepository = Get.put(ProfileRepository());
  var box = Hive.box('user');

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

      print('_______Data User_______');
      box.putAll({
        'id': user?.id,
        'email': user?.email,
        'session': session,
        'isAuth': isAuthenticated
      });
      await _profileRepository.fetchUser();
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
