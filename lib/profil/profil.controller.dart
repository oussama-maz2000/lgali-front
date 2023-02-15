import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/user.model.dart';

class ProfilController extends GetxController {
  Rx<UserModel> person = UserModel().obs;
  late TextEditingController nameController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }
}
