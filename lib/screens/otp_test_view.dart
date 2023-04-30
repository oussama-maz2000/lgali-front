import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/controllers/otp.controller.dart';
import 'package:pinput/pinput.dart';
import 'dart:math' as math;
import '../shared/theme/app_theme.dart';

class OtpTest extends StatelessWidget {
  final controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );

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
              image: AssetImage("assets/images/otp.png"),
              scale: 1.0,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
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
                    top: -100,
                    left: -50,
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
                        color: Color(0xFFFFFFFF),
                      ),
                      child: ListView(
                        children: [
                          SafeArea(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 32.0),
                                  child: const Text(
                                    "Verification",
                                    style: TextStyle(
                                        color: AppTheme.title2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Enter your OTP code number",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(28),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        Pinput(
                                          defaultPinTheme: defaultPinTheme,
                                          length: 6,
                                          controller: controller.otpCode,
                                        ),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller.verification();
                                            },
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xff136AFB)),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(14.0),
                                              child: Text(
                                                'Verify',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),

                                const SizedBox(
                                  height: 18,
                                ),
                                const Text(
                                  "Didn't you receive any code?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                TextButton(
                                  child: const Text(
                                    'Resend New Code',
                                    style: TextStyle(
                                      color: Color(0xff136AFB),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.printOtp();
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // reSendOtp()
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
