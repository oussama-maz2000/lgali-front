import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lgali/serviceCompany/serviceCompany.view.dart';
import 'package:line_icons/line_icons.dart';

import '../home/home.view.dart';
import '../model/credential.model.dart';
import '../notification/notification.view.dart';
import '../request/request.view.dart';
import '../utils/global.color.dart';

class DashBordController extends GetxController {
  final data = Get.put(PersonData());
  var tabIndex = 0.obs;
  var widgetsList = <Widget>[].obs;
  var iconList = <BottomNavigationBarItem>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bottomBar();
  }

  void bottomBar() {
    if (data.storage.read('usertype') == 'professional') {
      widgetsList.value = [
        HomeScreen(),
        NotificationScreen(),
        RequestView(),
        ServiceCompanyView()
      ];
      iconList.value=[
        bottomNavigationBarItem(
          icon: LineIcons.home,
          label: 'Home',
        ),
        bottomNavigationBarItem(
          icon: LineIcons.handshake,
          label: 'Accepted',
        ),
        bottomNavigationBarItem(
          icon: LineIcons.plusCircle,
          label: 'Send',
        ),
        bottomNavigationBarItem(
          icon: LineIcons.wrench,
          label: 'Service',
        ),
        bottomNavigationBarItem(
          icon: LineIcons.cogs,
          label: 'Settings',
        ),
      ];
    }
    else if(data.storage.read('usertype')=='particular'){
      widgetsList.value = [
        HomeScreen(),
        NotificationScreen(),
        RequestView(),

      ];
      iconList.value=[
        bottomNavigationBarItem(
          icon: LineIcons.home,
          label: 'Home',
        ),
        bottomNavigationBarItem(
          icon: LineIcons.handshake,
          label: 'Accepted',
        ),
        bottomNavigationBarItem(
          icon: LineIcons.plusCircle,
          label: 'Send',
        ),

        bottomNavigationBarItem(
          icon: LineIcons.cogs,
          label: 'Settings',
        ),
      ];
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;

  }

  bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: GlobalColor.mainColor,
        size: 35,
      ),
      label: label,
    );
  }
}
