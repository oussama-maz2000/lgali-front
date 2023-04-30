import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/controllers/dashbord.controller.dart';

class CustomSnackBar {
  DashBordController dashBordController = Get.put(DashBordController());
  String title;
  String message;
  Color backGround;
  int index = 3;

  CustomSnackBar(this.title, this.message, this.backGround) {
    Get.snackbar(title, message,
        backgroundColor: backGround,
        colorText: Colors.white,
        margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
        snackPosition: SnackPosition.BOTTOM);
  }

  CustomSnackBar.top(this.title, this.message, this.backGround) {
    Get.snackbar(title, message,
        backgroundColor: backGround,
        colorText: Colors.white,
        margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
        snackPosition: SnackPosition.TOP,
        duration: Duration(milliseconds: 9000),
        onTap: (v) {
      dashBordController.tabIndex.value = index;
    });
  }
}
