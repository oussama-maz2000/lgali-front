import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lgali/controllers/login.controller.dart';
import 'package:lgali/screens/Sign_up_test.dart';
import 'package:lgali/screens/home.view.dart';
import 'package:lgali/screens/log_in_test.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:lgali/screens/newRequest.view.dart';
import 'package:lgali/screens/notification.view.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/screens/request.view.dart';
import 'package:lgali/screens/sign.view.dart';
import 'package:lgali/screens/stepper.view.dart';
import 'package:lgali/screens/stepper/user_info.view.dart';
import 'package:lgali/screens/stepper/user_type.view.dart';
import 'package:lgali/shared/display.view.dart';
import '../shared/global.color.dart';
import '../shared/loading.dart';
import '../shared/tabBarTest.dart';
import 'dashbord.view.dart';
import 'displayRequest.view.dart';
import 'otp_test_view.dart';
import 'stepper/company_info.view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.to(() => Loading(UserInfoScreen()));
    });
    return Scaffold(
        backgroundColor: GlobalColor.backGroundColor,
        body: Center(
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: GlobalColor.backGroundColor),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width / 2,
              right: MediaQuery.of(context).size.width / 2,
              top: MediaQuery.of(context).size.height / 2,
              bottom: MediaQuery.of(context).size.height / 2,
              child: Image.asset('assets/images/elGali.jpeg'),
            )
          ]),
        ));
  }
}
