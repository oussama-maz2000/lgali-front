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
import 'display_request_companies.view.dart';
import 'otp_test_view.dart';
import 'stepper/company_info.view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      print('called user info screen');
      Get.to(() => RegisterScreen());
    });
    return Scaffold(
        body: Center(
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: GlobalColor.backGroundColor),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width / 1.3,
          child: Column(
            children: [
              Container(
                height: 120.0,
                width: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/splach.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                child: Text(
                  'El Gali',
                  style: TextStyle(
                    fontFamily: 'Oxygen',
                    color: Color(0xFFEAEFF7),
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
