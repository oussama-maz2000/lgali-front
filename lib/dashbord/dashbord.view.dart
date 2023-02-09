import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lgali/home/home.view.dart';
import 'package:lgali/notification/notification.view.dart';
import 'package:lgali/utils/global.color.dart';

import 'dashbord.controller.dart';

class DashBordScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBordController>(
        init: DashBordController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                child: IndexedStack(
                  index: controller.tabIndex,
                  children: [HomeScreen(), NotificationScreen()],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                //unselectedItemColor: Colors.black,
                selectedItemColor: GlobalColor.textColor,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                items: [
                  _bottomNavigationBarItem(
                    icon: Icons.home,
                    label: 'Home',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.notification_add_rounded,
                    label: 'Notification',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.workspace_premium_sharp,
                    label: 'Pro',
                  ),
                  _bottomNavigationBarItem(
                    icon: Icons.settings,
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          );
        });
  }
}
