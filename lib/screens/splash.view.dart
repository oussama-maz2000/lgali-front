import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lgali/controllers/login.controller.dart';
import 'package:lgali/screens/Sign_up_test.dart';
import 'package:lgali/screens/displayClientInformation.view.dart';
import 'package:lgali/screens/home.view.dart';
import 'package:lgali/screens/log_in_test.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:lgali/screens/newRequest.view.dart';
import 'package:lgali/screens/accept.view.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/screens/request.view.dart';
import 'package:lgali/screens/serviceCompany.view.dart';
import 'package:lgali/screens/sign.view.dart';
import 'package:lgali/screens/stepper.view.dart';
import 'package:lgali/screens/stepper/term.view.dart';
import 'package:lgali/screens/stepper/user_info.view.dart';
import 'package:lgali/screens/stepper/user_type.view.dart';
import 'package:lgali/shared/display.view.dart';
import '../shared/global.color.dart';
import '../shared/loading.dart';
import '../shared/tabBarTest.dart';
import 'dashbord.view.dart';
import 'displayRequest.view.dart';
import 'displayRequestCompanies.view.dart';
import 'otp_test_view.dart';
import 'stepper/company_info.view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        {print('calling user info screen'), Get.to(() => DashBordScreen())});
    return Scaffold(
        backgroundColor: GlobalColor.redColor,
        body: Center(
          child: Container(
            height: 200.0,
            width: 220.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/splach1.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),
        ));
  }
}
