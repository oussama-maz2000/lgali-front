import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  late TextEditingController firstName, lastName, phone;

  var firstNameValid = false.obs;
  var lastNameValid = false.obs;
  var phoneValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
  }
}
