import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/person.model.dart';

class ProfilController extends GetxController {
  Rx<Person> person = Person('oussama', 22, 'oussama@gmail.com').obs;
  late TextEditingController nameController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }
}
