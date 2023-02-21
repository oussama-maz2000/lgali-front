import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/login.view.dart';
import 'package:lgali/model/storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class ProfilController extends GetxController {
  final supabase = Supabase.instance.client;
  final data=Get.put(Data());
 var fname,lname,email,phone;


  @override
  void onInit() {
    super.onInit();
    fname=data.storage.read('fname');
    lname=data.storage.read('lname');
    phone=data.storage.read('phone');
    email=data.storage.read('email');


  }
  Future<void> signOut() async {
    await supabase.auth.signOut();
    data.storage.erase();
    print(data.storage.read('session'));
    Get.offAll(()=>LoginScreen());
  }
}
