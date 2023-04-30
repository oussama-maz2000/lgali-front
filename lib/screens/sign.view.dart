import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/sing.controller.dart';
import '../shared/global.color.dart';
import 'login.view.dart';

class SignScreen extends StatelessWidget {
  // final controller = Get.put(SignController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0c1425),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Stack(
            children: [
              Positioned(
                top: 35,
                left: 133,
                right: 150,
                height: 40,
                child: Icon(
                  LineIcons.userLock,
                  size: 90,
                  color: GlobalColor.cardColor,
                ),
              ),
              Positioned(
                top: 145,
                left: 155,
                //right: 130,
                child: Text(
                  "Sign Up ",
                  style: TextStyle(
                      color: GlobalColor.cardColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                  top: 180,
                  left: 3,
                  right: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
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
                                width: MediaQuery.of(context).size.width - 60,
                                height: 45,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 23),
                                  decoration: InputDecoration(
                                      hintText: 'Email address',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintStyle:
                                          TextStyle(height: 1, fontSize: 20),
                                      prefixIcon: Icon(Icons.email_rounded)),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 360,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 60,
                                height: 45,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 23),
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintStyle:
                                          TextStyle(height: 1, fontSize: 20),
                                      prefixIcon:
                                          Icon(Icons.lock_outline_rounded)),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            //   onTap: () => {controller.isValid()},
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width - 180,
                              decoration: BoxDecoration(
                                color: GlobalColor.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Send',
                                style: TextStyle(
                                    color: GlobalColor.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: 450,
                  left: 100,
                  right: 90,
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Already have account ?",
                          style: TextStyle(
                            fontSize: 14,
                            color: GlobalColor.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            Get.off(() => LoginScreen());
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: GlobalColor.buttonColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
