import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lgali/utils/global.color.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('-Or log in with :',
              style: TextStyle(color: GlobalColor.textColor, fontSize: 13)),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                      )
                    ]),
                child: SvgPicture.asset(
                  'assets/images/facebook.svg',
                  height: 50,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                      )
                    ]),
                child: SvgPicture.asset(
                  'assets/images/google.svg',
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
