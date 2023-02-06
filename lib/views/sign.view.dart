import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/views/login.view.dart';
import 'package:lgali/views/widgets/button.form.dart';
import 'package:lgali/views/widgets/social.login.dart';
import 'package:lgali/views/widgets/text.form.dart';
import '../utils/global.color.dart';
import 'package:get/route_manager.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            TextForm(
                controller: userNameController,
                text: 'User Name',
                textInputType: TextInputType.name,
                obscure: false),
            SizedBox(
              height: 15,
            ),
            TextForm(
                controller: emailController,
                text: 'Email',
                textInputType: TextInputType.emailAddress,
                obscure: false),
            SizedBox(
              height: 15,
            ),
            TextForm(
                controller: passwordController,
                text: 'Password',
                textInputType: TextInputType.visiblePassword,
                obscure: true),
            SizedBox(
              height: 20,
            ),
            CustomButton('Sign Up', emailController, passwordController,
                userNameController),
            SizedBox(
              height: 40,
            ),
            SocialLogin()
          ]),
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
