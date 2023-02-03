import './widgets/text.form.dart';

import 'package:flutter/material.dart';

import 'package:lgali/utils/global.color.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();

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
            Container(
              alignment: Alignment.center,
              child: Text(
                "LGALI",
                style: TextStyle(
                    fontFamily: 'Montserrat Subrayada',
                    color: GlobalColor.mainColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            Text('login to your account',
                style: TextStyle(
                    color: GlobalColor.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 15),
            TextForm(
              controller: emailController,
              text: 'email',
              textInputType: TextInputType.emailAddress,
              obscure: true,
            )
          ]),
        )),
      ),
    );
  }
}
