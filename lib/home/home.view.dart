import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lgali/home/home.controller.dart';
import 'package:lgali/notification/notification.view.dart';

import '../utils/global.color.dart';
import '../views/widgets/card.form.dart';

class HomeScreen extends GetView<HomeController> {
  var _HomeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
                margin: EdgeInsets.only(right: 7),
                child: IconButton(
                  icon: Icon(
                    Icons.account_circle_rounded,
                    size: 45,
                    color: GlobalColor.mainColor,
                  ),
                  onPressed: () {
                    //Get.to(profilScreen);
                  },
                ))
          ]),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Discover :",
              style: TextStyle(
                  color: GlobalColor.mainColor,
                  fontSize: 32,
                  //fontFamily: 'brandon',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
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
        ],
      )),
    );
  }
}
