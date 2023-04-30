import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/controllers/stepper/user_info.controller.dart';
import 'package:lgali/screens/stepper/term.view.dart';
import 'package:lgali/screens/stepper/user_info.view.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:supabase/supabase.dart';

import '../../shared/global.color.dart';
import '../../shared/loading.dart';
import '../../shared/theme/app_theme.dart';
import 'company_info.view.dart';

class UserTypeScreen extends StatefulWidget {
  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  var box = Hive.box('user');

  var professional = false.obs;
  var particular = true.obs;

  void userTypeSelected() {
    if (professional.isTrue)
      box.put('type', 'professional');
    else
      box.put('type', 'particular');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(children: [
        SizedBox(
          height: 80,
        ),
        Container(
            child: Text(
          "Type of Account",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppTheme.title2),
        )),
        SizedBox(
          height: 4,
        ),
        Container(
            margin: EdgeInsets.only(left: 25),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Choose the type of your account, if you have company/profession select professional',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Oxygen',
                    color: GlobalColor.textColor),
              ),
            )),
        SizedBox(
          height: 30,
        ),
        SelectableContainer(
            selected: particular.value,
            onValueChanged: (value) {
              setState(() {
                professional.value = false;
                particular.value = true;
              });
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                elevation: 0,
                color: GlobalColor.cardColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/prt.png'),
                  radius: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'I am a particular',
                    style: TextStyle(
                        color: GlobalColor.buttonColor,
                        fontFamily: 'Oxygen',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Find a service online, access',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontFamily: 'Oxygen',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    ' companies and more',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontFamily: 'Oxygen',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ])),
        SizedBox(
          height: 26,
        ),
        SelectableContainer(
            selected: professional.value,
            onValueChanged: (value) {
              setState(() {
                professional.value = true;
                particular.value = false;
              });
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                elevation: 0,
                color: GlobalColor.cardColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pro.png'),
                  radius: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'I am a professional',
                    style: TextStyle(
                        color: GlobalColor.buttonColor,
                        fontSize: 18,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The easiest way to raise',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontFamily: 'Oxygen',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    ' your service online',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontFamily: 'Oxygen',
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ])),
        SizedBox(
          height: MediaQuery.of(context).size.height - 570,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.off(()=>UserInfoScreen());
              },
              child: Text('Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff136AFB),
                textStyle:
                    TextStyle(color: GlobalColor.cardColor, fontSize: 17),
                fixedSize: Size(90, 40),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {
                userTypeSelected();
                if (professional.value) {
                  Get.off(() => CompanyInfoScreen());
                } else {
                  Get.off(() => TermsScreen());
                }
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff136AFB),
                textStyle:
                    TextStyle(color: GlobalColor.cardColor, fontSize: 17),
                fixedSize: Size(90, 40),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ],
        )
      ])),
    );
  }
}
