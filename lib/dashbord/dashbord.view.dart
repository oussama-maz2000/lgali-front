import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/home/home.view.dart';
import 'package:lgali/notification/notification.view.dart';
import 'package:lgali/request/request.view.dart';

import 'package:lgali/utils/global.color.dart';
import 'package:line_icons/line_icons.dart';

import 'dashbord.controller.dart';

class DashBordScreen extends GetView<DashBordController> {
  final controller = Get.put(DashBordController());

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: GlobalColor.mainColor,
        size: 35,
      ),
      label: label,
    );
  }

  List<Widget> _widget = [HomeScreen(), NotificationScreen(), RequestView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Obx(
            ()=> IndexedStack(
              index: controller.tabIndex.value,
              children: controller.widgetsList,
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              //unselectedItemColor: Colors.black,
              selectedItemColor: GlobalColor.textColor,
              onTap: (index) {
                controller.tabIndex.value=index;

              },
              currentIndex: controller.tabIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 0,
              items: controller.iconList),
        ),
      ),
    );
  }
}
