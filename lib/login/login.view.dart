import 'package:get/get.dart';
import 'package:lgali/login/login.controller.dart';
import 'package:lgali/signup/sign.view.dart';
import 'package:lgali/views/widgets/social.login.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../views/widgets/text.form.dart';

import 'package:flutter/material.dart';

import 'package:lgali/utils/global.color.dart';

class LoginView extends GetView<LoginController> {
  var _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: false,

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
              left: 130,
              right: 150,
              height: 40,
              child: Icon(
                Icons.login_rounded,
                size: 80,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 140,
              left: 87,
              //right: 130,
              child: Text(
                "Welcome to you account ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),

            Positioned(
                top: 180,
                left: 3,
                right: 3,
                child: Container(
                  width: 400,
                  height: 262,
                  child: Card(
                    elevation: 5,
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

                                onChanged: (v) {

                                },
                                style: TextStyle(fontSize: 23),
                                autofocus: true,
                                decoration: InputDecoration(
                                    hintText: 'Email address',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    hintStyle:
                                    TextStyle(height: 1, fontSize: 20),
                                    prefixIcon: Icon(Icons.email_rounded)
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          width: 360,
                          child: Center(
                            child: Container(
                              child: TextFormField(
                                obscureText: true,
                                onChanged: (v) {

                                },
                                style: TextStyle(fontSize: 23),
                                autofocus: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    hintStyle:
                                    TextStyle(height: 1, fontSize: 20),
                                    prefixIcon: Icon(Icons.lock_outline_rounded)
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      InkWell(
                            onTap: () => {

                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 360,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23),
                              ),
                            ),
                          ),

                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                )),
            Positioned(
                top :450,
                left: 100,
                right: 90,
                child: Container(child: Row(
                  children: [
                    Text(
                      "You haven't account ?",
                      style: TextStyle(
                        fontSize: 14,
                        color: GlobalColor.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 7,),
                    InkWell(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          color: GlobalColor.buttonColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),))

          ],
        ),
      ),
    ),
  );;
  }}