import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/profileRepository.dart';
import 'package:lgali/screens/dashbord.view.dart';
import 'package:lgali/screens/stepper.view.dart';
import 'package:lgali/shared/custom_snack_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../shared/global.color.dart';

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
  void onInit() async {
    super.onInit();
    emailValid = false.obs;
    passwordValid = false.obs;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      exit(0);
    }
  }

  Future<void> logInWithPassword() async {
    try {
      final AuthResponse response = await supabase.auth.signInWithPassword(
          password: passwordController.value.text,
          email: emailController.value.text);
      user = response.user;
      session = supabase.auth.currentSession?.accessToken;
      session == null ? isAuthenticated = false : isAuthenticated = true;

      try {
        List data = await _profileRepository.fetchUser(user?.id);
        box.putAll({
          'id': user?.id,
          'email': user?.email,
          'session': session,
          'isAuth': isAuthenticated,
          'type': data[4]
        });

        CustomSnackBar(
            'Logged in', "Welcome in your account", GlobalColor.redColor);

        Get.offAll(() => DashBordScreen());
      } catch (e) {
        CustomSnackBar(
            'Warning', 'Create Your Profile Please ...', Colors.orangeAccent);
        Get.to(() => StepperScreen());
      }
    } catch (e) {
      CustomSnackBar('Error', 'invalid email', Colors.redAccent);
    }
  }
}
