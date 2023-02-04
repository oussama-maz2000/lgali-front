import 'package:flutter/material.dart';
import '../utils/global.color.dart';

class SignView extends StatefulWidget {
  const SignView({super.key});

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(children: [
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
        ]),
      ),
    ));
  }
}
