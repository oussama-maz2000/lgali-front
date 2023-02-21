import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/home.controller.dart';
import '../utils/card.form.dart';
import '../utils/global.color.dart';


class HomeScreen extends GetView<HomeController> {
  var _HomeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    "Services ",
                    style: TextStyle(
                        color: GlobalColor.buttonColor,
                        fontSize: 35,
                        //fontFamily: 'brandon',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 15,bottom: 4),
                    child: IconButton(
                      icon: Icon(
                        LineIcons.userCircleAlt,
                        size: 50,
                        color: GlobalColor.buttonColor,
                      ),
                      onPressed: () {
                        Get.to(ProfilScreen());
                      },
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => controller.checkGPS == true
                  ? Expanded(
                      child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: [
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                        CardCustom(),
                      ],
                    ))
                  : Text('enable you GPS please'),
            )
          ],
        )),
      ),
    );
  }
}
