import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


import '../screens/dashbord.view.dart';
import '../model/storage.dart';
import '../utils/global.color.dart';

class CompanyController extends GetxController{
  final data = Get.put(Data());
  var cName,cAddress,cDescription,cPhone;
var validPhone=false.obs;
var validName=false.obs;
var selected=''.obs ;

  @override
  void onInit() {
    super.onInit();
    cName=TextEditingController();
    cAddress=TextEditingController();
    cDescription=TextEditingController();
    cPhone=TextEditingController();
  }


Future<void> companyForm() async{
    if(validName.value && validPhone.value){
      Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      data.storage.write('cname', cName.value.text);
      data.storage.write('cphone', cPhone.value.text);
      data.storage.write('ctype', selected.value);
      data.storage.write('caddress', cAddress.value.text);
      data.storage.write('cdescription', cDescription.value.text);
      data.storage.write('clatitude', cDescription.value.text);
      data.storage.write('clongitude', cDescription.value.text);
      Get.snackbar("Valid", "your account has been created successfully",
          backgroundColor: GlobalColor.greenColor,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
      Timer(Duration(seconds: 3), () {
        Get.to(() =>DashBordScreen());
      });

    }else if(!validName.value || !validPhone.value){
      Get.snackbar("Error", "Invalid phone or company name too short",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
    }
}

}