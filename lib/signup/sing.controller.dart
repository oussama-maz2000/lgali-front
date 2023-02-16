import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/model/credential.model.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignController extends GetxController {
  final supabase = Supabase.instance.client;
  User? user;
  var emailValid = false.obs;
  var passwordValid=false.obs;
  var passwordController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
var btnClr=GlobalColor.white.obs;
var txtClr=GlobalColor.black.obs;
  @override
  void onInit() {
    super.onInit();


  }

  @override
  void onClose() {

  }

    isValid(){
 if(!emailValid.value || !passwordValid.value){
   return Get.showSnackbar(
     GetSnackBar(
       title: "invalid email or password",
       message: 'password must be greater then 6',
       icon: const Icon(Icons.error_outline),
       duration: const Duration(seconds: 3),

       backgroundColor: Colors.red,
     ),
   );
 }

  }



}