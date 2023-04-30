import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';

class TermController extends GetxController {
  var box = Hive.box('user');

  @override
  void onInit() {
    super.onInit();
  }

  void printdata() {
    print(box.get('id'));
    print(box.get('firstName'));
    print(box.get('lastName'));
    print(box.get('phone'));
    print(box.get('type'));
    print(box.get('selected'));
    print(box.get('cmpName'));
    print(box.get('cmpPhone'));
    print(box.get('latitude'));
    print(box.get('longitude'));
  }
}
