import 'package:get/get.dart';

class DisplayCompaniesRequestController extends GetxController{

  var data=Get.arguments;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(data);
  }

}