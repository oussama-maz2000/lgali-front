import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:lgali/model/repository/requestRepository.dart';
import 'package:lgali/shared/custom_snack_bar.dart';
import 'package:lgali/shared/global.color.dart';

class RequestController extends GetxController {
  var repository = Get.lazyPut(() => RequestRepository());
  var _requestRepository = Get.find<RequestRepository>();
  var box = Hive.box('user');

  var selectedItem = ''.obs;

  late TextEditingController descriptionController = TextEditingController();
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var index = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;
  }

  Future<void> sendRequest() async {
    if (selectedItem.value.isEmpty != true && index.value == 0) {
      index.value = 1;
      await Future.delayed(Duration(seconds: 4), () {
        _requestRepository.createNewRequest(box.get('id'), selectedItem.value,
            descriptionController.text, latitude.value, longitude.value);

        index.value = 0;

        CustomSnackBar('Searching', 'Your Request Has Been Sent',
            GlobalColor.blackNotification);
      });
    }
  }
}
