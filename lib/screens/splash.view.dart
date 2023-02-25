import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/screens/sign.view.dart';
import 'package:lgali/screens/stepper.view.dart';
import '../utils/global.color.dart';
import 'dashbord.view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.to(() => ProfilScreen());
    });
    return Scaffold(
        backgroundColor: GlobalColor.mainColor,
        body: Center(
            child: Text(
          "LGALI",
          style: TextStyle(
              fontFamily: 'brandon',
              color: Color.fromARGB(255, 240, 235, 235),
              fontSize: 35,
              fontWeight: FontWeight.bold),
        )));
  }
}
