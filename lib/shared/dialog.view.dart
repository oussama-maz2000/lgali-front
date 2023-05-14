import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialog {
  static void showDialog() {
    Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          title: Text("Request"),
          content: Text("you have request from X are you ready ?"),
          actions: [
            TextButton(onPressed: () {}, child: Text('Accept')),
            TextButton(onPressed: () {}, child: Text('Refuse')),
          ],
        ));
  }
}
