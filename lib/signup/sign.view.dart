import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/login/login.view.dart';
import 'package:lgali/signup/sing.controller.dart';

import 'package:lgali/views/widgets/social.login.dart';

import '../utils/global.color.dart';

class SignView extends GetView<SignContoller> {
  var _signController = Get.put(SignContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Form(
              key: controller.signFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "LGALI",
                        style: TextStyle(
                            fontFamily: 'brandon',
                            color: GlobalColor.mainColor,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 35),
                    Text(
                      'Create New Account :',
                      style: TextStyle(
                          color: GlobalColor.textColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: controller.userController,
                      onSaved: (value) => {controller.user = value!},
                      validator: (value) {
                        return controller.validateUserName(value!);
                      },
                      decoration: InputDecoration(
                          hintText: 'User Name',
                          border: InputBorder.none,
                          hintStyle: TextStyle(height: 1),
                          prefixIcon: Icon(Icons.person)),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      onSaved: (value) => {controller.email = value!},
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          hintStyle: TextStyle(height: 1),
                          prefixIcon: Icon(Icons.email_rounded)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      onSaved: (value) => {controller.password = value!},
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          hintStyle: TextStyle(height: 1),
                          prefixIcon: Icon(Icons.lock)),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => {controller.checkSign()},
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        decoration: BoxDecoration(
                            color: GlobalColor.mainColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: GlobalColor.mainColor.withOpacity(0.7),
                                blurRadius: 10,
                              )
                            ]),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SocialLogin()
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 15),
        color: Colors.white,
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "You have account ?",
            style: TextStyle(color: GlobalColor.textColor, fontSize: 12),
          ),
          InkWell(
            onTap: () {
              Get.to(LoginView());
            },
            child: Text(
              ' Log In',
              style: TextStyle(color: GlobalColor.mainColor, fontSize: 15),
            ),
          )
        ]),
      ),
    );
  }
}
