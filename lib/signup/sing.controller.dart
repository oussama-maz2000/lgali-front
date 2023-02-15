import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lgali/model/credential.model.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignController extends GetxController {
  final supabase=Supabase.instance.client;
  User?user;
  var isValid = false.obs;
  TextEditingController phoneController = TextEditingController();
  late Credential credential;
  var button = GlobalColor.white.obs;
  var text = GlobalColor.black.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
  }

  Future<void> sendOtp() async {
    try{
      var authResponse=await supabase.auth.signInWithOtp(phone: '+2130696085252' );

    }
        catch(e){
      print(e);
        }
  }
}
