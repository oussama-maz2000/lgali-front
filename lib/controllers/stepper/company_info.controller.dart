import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CompanyInfoController extends GetxController {
  var box = Hive.box('user');
  var data = new Map();
  late TextEditingController companyName, companyPhone;
  late Position position;
  var selected = ''.obs;
  var companyNameValid = false.obs;
  var companyPhoneValid = false.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  @override
  void onInit() {
    companyName = TextEditingController();
    companyPhone = TextEditingController();
    super.onInit();
  }

  void setDataHive() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    data = {
      'selected': selected.value,
      'cmpName': companyName.value.text,
      'cmpPhone': companyPhone.value.text,
      'latitude': latitude.value,
      'longitude': longitude.value
    };
    box.putAll(data);
  }
}
