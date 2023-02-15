import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/login/login.controller.dart';
import 'package:lgali/login/login.view.dart';
import 'package:lgali/signup/otp.view.dart';
import 'package:lgali/signup/sing.controller.dart';
import 'package:lgali/views/widgets/button.form.dart';
import 'package:lgali/views/widgets/social.login.dart';
import 'package:lgali/views/widgets/text.form.dart';
import 'package:line_icons/line_icons.dart';
import '../utils/global.color.dart';
import 'package:get/route_manager.dart';

class SignView extends GetView<SignController> {
  final _controller = Get.put(SignController());

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
                    print('go back');
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
                  LineIcons.phone,
                  size: 80,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 120,
                left: 100,
                right: 100,
                child: Text(
                  "Entre your phone number",
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
                  "We'll send you a verification code",
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
                                child: TextFormField(
                                  controller: controller.phoneController,
                                  onChanged: (v) {
                                    if (v.length == 10) {
                                      controller.button.value =
                                          GlobalColor.buttonColor;
                                      controller.text.value = GlobalColor.white;
                                      controller.isValid.value = true;
                                      print(controller.isValid.value);
                                    } else if (v.length < 10 || v.length > 10) {
                                      controller.button.value =
                                          GlobalColor.white;
                                      controller.text.value = GlobalColor.black;
                                      controller.isValid.value = false;
                                    }
                                    ;
                                  },
                                  style: TextStyle(fontSize: 20),
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    hintText: 'Phone number',
                                    prefix: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text(
                                        '+213',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintStyle:
                                        TextStyle(height: 1, fontSize: 20),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => InkWell(
                              onTap: () => {
                                if(controller.isValid.isTrue){
                                  controller.sendOtp(),
                                  Get.to(()=>OtpView())
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 55,
                                width: 360,
                                decoration: BoxDecoration(
                                  color: controller.button.value,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  'Send',
                                  style: TextStyle(
                                      color: controller.text.value,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23),
                                ),
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
  }
}
