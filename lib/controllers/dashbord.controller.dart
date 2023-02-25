import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/serviceCompany.view.dart';
import 'package:line_icons/line_icons.dart';
import '../screens/home.view.dart';
import '../screens/notification.view.dart';
import '../screens/request.view.dart';
import '../utils/global.color.dart';

class DashBordController extends GetxController {
  var tabIndex = 0.obs;
  var widgetsList = <Widget>[].obs;
  var iconList = <BottomNavigationBarItem>[].obs;

  @override
  void onInit() async {
    super.onInit();
    bottomBar();
  }

  void bottomBar() {
    if ('professional' == 'professional') {
      widgetsList.value = [
        HomeScreen(),
        NotificationScreen(),
        RequestScreen(),
        ServiceCompanyScreen()
      ];
      iconList.value = [
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
    } else if ('usertype' == 'particular') {
      widgetsList.value = [
        HomeScreen(),
        NotificationScreen(),
        RequestScreen(),
      ];
      iconList.value = [
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
