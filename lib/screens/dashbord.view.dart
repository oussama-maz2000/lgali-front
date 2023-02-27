import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashbord.controller.dart';
import '../utils/global.color.dart';

class DashBordScreen extends GetView<DashBordController> {
  final controller = Get.put(DashBordController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Obx(
            () => IndexedStack(
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
                controller.tabIndex.value = index;
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
