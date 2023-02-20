import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/credential.model.dart';

class CompanyController extends GetxController{
  final data=Get.put(PersonData());
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
     /* data.storage.write('cname', cName.value.text);
      data.storage.write('cphone', cPhone.value.text);
      data.storage.write('ctype', selected.value);
      data.storage.write('caddress', cAddress.value.text);
      data.storage.write('cdescription', cDescription.value.text);
      data.storage.write('clatitude', cDescription.value.text);
      data.storage.write('clongitude', cDescription.value.text);
      print(data.storage.read('cname'));
      print(data.storage.read('cphone'));
      print(data.storage.read('ctype'));
      print(data.storage.read('caddress'));
      print(data.storage.read('cdescription'));
      print(data.storage.read('usertype'));
      print(data.storage.read('clatitude'));
      print(data.storage.read('clongitude'));*/
      print(position.longitude);

      print(position.latitude);

    }else if(!validName.value || !validPhone.value){
      Get.snackbar("Error", "Invalid phone or company name too short",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          margin: EdgeInsets.only(bottom: 4, left: 4, right: 4),
          snackPosition: SnackPosition.BOTTOM);
    }
}

}