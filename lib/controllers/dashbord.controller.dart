import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:lgali/model/repository/companyRepository.dart';
import 'package:lgali/model/repository/profileRepository.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/screens/serviceCompany.view.dart';
import 'package:lgali/shared/custom_snack_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../screens/home.view.dart';
import '../screens/accept.view.dart';
import '../screens/request.view.dart';
import '../shared/global.color.dart';
import '../shared/tabBarTest.dart';

class DashBordController extends GetxController {
  var box = Hive.box('user');
  CompanyRepository companyRepository = Get.put(CompanyRepository());

  static RxInt tabIndex = 0.obs;
  var widgetsList = <Widget>[].obs;
  var iconList = <BottomNavigationBarItem>[].obs;

  @override
  void onInit() async {
    super.onInit();
    /*  print(box.get('id'));
    print(box.get('email'));
    print(box.get('session'));
    print(box.get('isAuth'));
    print(box.get('type')); */
    print('dashbord controller called');
    bottomBar();
    companyRepository.listenToChanges();
  }

  void bottomBar() {
    if ("professional" == 'professional') {
      widgetsList.value = [
        HomeScreen(),
        AcceptScreen(),
        RequestScreen(),
        ServiceCompanyScreen(),
        ProfilScreen()
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
          icon: LineIcons.userCircle,
          label: 'Profil',
        ),
      ];
    } else if (box.get('type') == 'particular') {
      widgetsList.value = [
        HomeScreen(),
        AcceptScreen(),
        RequestScreen(),
        ProfilScreen()
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
          icon: LineIcons.userCircle,
          label: 'Profil',
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
        color: GlobalColor.blackNew,
        size: 35,
      ),
      label: label,
    );
  }

  void changeIndex() {
    tabIndex.value = 3;
  }
}
