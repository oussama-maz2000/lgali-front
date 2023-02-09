import 'package:get/get.dart';
import 'package:lgali/home/home.controller.dart';

import 'dashbord.controller.dart';

import '../notification/notification.controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBordController());
    Get.put(NotificationController());
    Get.put(HomeController());
  }
}
