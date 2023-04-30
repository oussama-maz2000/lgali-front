import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';

class UserInfoController extends GetxController {
  var box = Hive.box('user');
  var data = new Map();
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


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firstName.delete();
    lastName.delete();
    phone.delete();
    firstNameValid.close();
    lastNameValid.close();
    phoneValid.close();
  }

  void setDataHive() {
    data = {
      'firstName': firstName.value.text,
      'lastName': lastName.value.text,
      'phone': phone.value.text
    };
    box.putAll(data);
  }
}
