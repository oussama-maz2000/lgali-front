import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashbord.controller.dart';
import '../shared/global.color.dart';

class DashBordScreen extends GetView<DashBordController> {
  //final controller = Get.put(DashBordController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DashBordController());
    final controller = Get.find<DashBordController>();
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
              selectedItemColor: GlobalColor.blackNew,
              onTap: (index) {
                controller.tabIndex.value = index;
                print(controller.tabIndex);
              },
              currentIndex: controller.tabIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: GlobalColor.cardColor,
              elevation: 0,
              items: controller.iconList),
        ),
      ),
    );
  }
}
