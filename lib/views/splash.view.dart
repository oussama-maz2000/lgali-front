import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:lgali/views/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.to(() => LoginView());
    });
    return Scaffold(
      backgroundColor: GlobalColor.mainColor,
      body: Center(
          child: Text(
        "LGALI",
        style: TextStyle(
            fontFamily: 'Montserrat Subrayada',
            color: Color.fromARGB(255, 240, 235, 235),
            fontSize: 35,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
