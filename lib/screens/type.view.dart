import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/registration.view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:selectable_container/selectable_container.dart';

import '../controllers/type.controller.dart';
import '../model/storage.dart';
import '../utils/global.color.dart';
import 'company.view.dart';

class UserTypeScreen extends GetView<TypeController> {
  final _typeCon = Get.put(TypeController());
  final data = Get.put(Data());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Container(
            child: Text(
          "Type of Account",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: GlobalColor.buttonColor),
        )),
        SizedBox(
          height: 6,
        ),
        Container(
            margin: EdgeInsets.only(left: 25),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Choose the type of your account, be careful to change it impossible',
                style: TextStyle(fontSize: 16, color: GlobalColor.textColor),
              ),
            )),
        SelectableContainer(
            selected: false,
            onValueChanged: (value) {
              print('clicked');
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                elevation: 0,
                color: controller.cardColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/prt.png'),
                  radius: 65,
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
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Find a service online, access',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    ' companies and more',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ])),
        SizedBox(
          height: 20,
        ),
        SelectableContainer(
            selected: true,
            onValueChanged: (value) {
              print('clicked');
            },
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Card(
                elevation: 0,
                color: GlobalColor.cardColor,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pro.png'),
                  radius: 65,
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
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The easiest way to raise',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    ' your service online',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ])),
      ])),
    ));
  }
}
