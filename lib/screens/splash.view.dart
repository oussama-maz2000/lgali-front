import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lgali/controllers/login.controller.dart';
import 'package:lgali/screens/home.view.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/screens/sign.view.dart';
import 'package:lgali/screens/stepper.view.dart';
import 'package:lgali/screens/test.view.dart';
import '../utils/global.color.dart';
import 'dashbord.view.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.to(() => HomeScreen());
    });
    return Scaffold(
        
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  GlobalColor.buttonColor,
                  GlobalColor.black
                ],
              )
          ),
          child: Center(
              child: Text(
            "El Gali",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: Color.fromARGB(255, 240, 235, 235),
                    fontSize: 60,
                    fontWeight: FontWeight.w500)),
          )),
        ));
  }
}
