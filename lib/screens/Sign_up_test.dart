import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/controllers/sing.controller.dart';
import 'package:lgali/screens/log_in_test.dart';
import 'package:lgali/screens/otp.view.dart';
import 'package:lgali/screens/otp_test_view.dart';

import '../../../shared/theme/app_theme.dart';
import '../shared/global.color.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(SignController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    print("Register screen--------------------------------------------");

    Widget topWidget(double screenWidth) {
      return Transform.rotate(
        angle: -155 * math.pi / 180,
        child: Container(
          width: 1.2 * screenWidth,
          height: 1 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
              begin: Alignment(-0.1, -0.6),
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFF5F5F5),
                Color(0xB3136AFB),
              ],
            ),
          ),
        ),
      );
    }

    Widget topWidgetWith(double screenWidth) {
      return Transform.rotate(
        angle: 0 * math.pi / 180,
        child: Container(
          width: 1.2 * screenWidth,
          height: 1 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            image: const DecorationImage(
              image: AssetImage("assets/images/Device2.png"),
              scale: 1.0,
            ),
          ),
        ),
      );
    }

    Widget toRegister() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Joined us before ?",
                style: TextStyle(
                  color: AppTheme.textForm2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xff136AFB),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Get.off(() => LoginScreenTest());
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              child: Stack(
                children: [
                  Positioned(
                    top: -120,
                    left: -50,
                    child: topWidget(screenSize.width),
                  ),
                  Positioned(
                    top: -40,
                    left: -20,
                    child: topWidgetWith(screenSize.width),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.66,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.66,
                      decoration: const BoxDecoration(
                        //color: Color(0xFF0c1425),
                        //color: Color(0xFFf5f5f5),
                        color: Color(0xFFFFFFFF),
                      ),
                      child: ListView(
                        children: [
                          SafeArea(
                            child: Column(
                              children: [
                                Container(
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: AppTheme.title2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27),
                                  ),
                                  alignment: Alignment.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  child: TextField(
                                    controller: controller.emailController,
                                    onChanged: (v) {
                                      if (v.contains('@') &&
                                          v.contains('.com')) {
                                        controller.emailValid.value = true;
                                      } else if (!v.contains('@') ||
                                          !v.contains('.com')) {
                                        controller.emailValid.value = false;
                                      }
                                    },
                                    cursorColor: AppTheme.textForm2,
                                    cursorRadius: const Radius.circular(10.0),
                                    cursorWidth: 2.0,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      icon: Icon(
                                        IconData(0xec56, fontFamily: 'icofont'),
                                        size: 14,
                                        color: AppTheme.textForm2,
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: AppTheme.textForm2,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: AppTheme.title2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0),
                                  child: TextField(
                                    controller: controller.passwordController,
                                    onChanged: (v) {
                                      if (v.length > 6) {
                                        controller.passwordValid.value = true;
                                      } else if (v.length < 6) {
                                        controller.passwordValid.value = false;
                                      }
                                    },
                                    cursorColor: AppTheme.textForm2,
                                    cursorRadius: const Radius.circular(10.0),
                                    cursorWidth: 2.0,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      icon: Icon(
                                        IconData(0xec61, fontFamily: 'icofont'),
                                        size: 14,
                                        color: AppTheme.textForm2,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: AppTheme.textForm2,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      //labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: AppTheme.textForm,
                                      ),
                                      //errorText: snapshot.error,
                                    ),
                                    style: const TextStyle(
                                      color: AppTheme.title2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff136AFB),
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: () {
                                      controller.registerEmailPassword();
                                    },
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                toRegister()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
