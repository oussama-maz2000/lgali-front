import 'package:lgali/views/widgets/social.login.dart';

import './widgets/text.form.dart';

import 'package:flutter/material.dart';

import 'package:lgali/utils/global.color.dart';

import './widgets/button.form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 40),
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
            SizedBox(height: 50),
            Text('log in to your account :',
                style: TextStyle(
                    color: GlobalColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 25),
            // Email Input
            TextForm(
              controller: emailController,
              text: 'email',
              textInputType: TextInputType.emailAddress,
              obscure: false,
            ),
            SizedBox(height: 15),
            // password Input
            TextForm(
              controller: passwordController,
              text: 'password',
              textInputType: TextInputType.visiblePassword,
              obscure: true,
            ),
            SizedBox(height: 20),
            CustomButton(),
            SizedBox(height: 40),
            SocialLogin(),
          ]),
        )),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 15),
        color: Colors.white,
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Don't have account ?",
            style: TextStyle(color: GlobalColor.textColor, fontSize: 12),
          ),
          InkWell(
            onTap: () {
              print('click Sign up');
            },
            child: Text(
              ' Sign Up',
              style: TextStyle(color: GlobalColor.mainColor, fontSize: 15),
            ),
          )
        ]),
      ),
    );
  }
}
