import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/home/home.view.dart';
import 'package:lgali/login/login.view.dart';
import 'package:lgali/signUp/sign.view.dart';
import 'package:lgali/splash/splash.controller.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:lgali/dashbord/dashbord.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.to(() => DashBordScreen());
    });
    return Scaffold(
        backgroundColor: GlobalColor.mainColor,
        body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) => Center(
              child: Text(
            "LGALI",
            style: TextStyle(
                fontFamily: 'brandon',
                color: Color.fromARGB(255, 240, 235, 235),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          )),
        ));
  }
}
