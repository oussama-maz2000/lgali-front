import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lgali/utils/global.color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextEditingController? emailController;
  final TextEditingController passwordController;
  final TextEditingController? userNameController;

  CustomButton(this.text, this.emailController, this.passwordController,
      this.userNameController);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (emailController!.text.length < 4)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('entre some text'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red[300],
              width: double.infinity,
            ))
          }
      },
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
          '$text',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}
