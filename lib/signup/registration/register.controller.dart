import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/dashbord/dashbord.view.dart';
import 'package:lgali/signup/Otp/otp.controller.dart';
import 'package:lgali/signup/TypeUser/type.view.dart';
import 'package:lgali/utils/global.color.dart';
import '../../model/credential.model.dart';

class RegistrationController extends GetxController {
  final data = Get.put(PersonData());
  OtpController otpController = Get.put(OtpController());
  late TextEditingController firstNameController,
      lastNameController,
      phoneController;
  var phoneIsValid, fNameValid, lNameValid;

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    lNameValid = false.obs;
    fNameValid = false.obs;
    phoneIsValid = false.obs;
  }

  void validationForm() {
    if (!fNameValid.value || !lNameValid.value || !phoneIsValid.value) {
      Get.snackbar("Error", "Invalid form , try again please",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);

    } else if (fNameValid.value && lNameValid.value && phoneIsValid.value) {
      print(firstNameController.value.text);
      print(lastNameController.value.text);
      data.storage.write('fname', firstNameController.value.text);
      data.storage.write('lname', lastNameController.value.text);
      data.storage.write("phone", phoneController.value.text);
      Get.snackbar("Valid", "your account has been created successfully",
          backgroundColor: GlobalColor.greenColor,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
      Timer(Duration(seconds: 2), () {
        Get.to(() => DashBordScreen());
      });
    }
  }
}
