
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/sign.view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otp.controller.dart';

import '../utils/global.color.dart';


class OtpScreen extends GetView<OtpController> {
  final _controller = Get.put(OtpController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Positioned(
                left: 1,
                right: 340,
                height: 40,
                top: 5,
                child: RawMaterialButton(
                  onPressed: () {
                    Get.to(SignScreen());

                  },
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(LineIcons.arrowLeft, size: 25),
                  shape: CircleBorder(),
                ),
              ),
              Positioned(
                top: 28,
                left: 150,
                right: 150,
                height: 40,
                child: Icon(
                  LineIcons.sms,
                  size: 80,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 120,
                left: 100,
                right: 100,
                child: Text(
                  "Verify your phone number",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                top: 150,
                left: 90,
                right: 90,
                child: Text(
                  "A 6 digit verification code has been sent to your phone number",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                  top: 180,
                  left: 3,
                  right: 3,
                  child: Container(
                    width: 400,
                    height: 160,
                    child: Card(
                      elevation: 8,
                      color: GlobalColor.cardColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 360,
                            child: Center(
                              child: Container(
                                  child: Pinput(
                                    controller: controller.otpCode,
                                length: 6,


                              )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () => {
                              controller.verification()
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 360,
                              decoration: BoxDecoration(
                                color: GlobalColor.buttonColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Send',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
    ;
  }
}
