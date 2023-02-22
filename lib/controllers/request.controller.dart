import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class RequestController extends GetxController {
  static const String google_api_key =
      "AIzaSyDS49TdZt6CC3DLj5WdIycGxGfar6YU04A";
  var selectedImagePath = ''.obs;
  var selectedItem = ''.obs;
  var selectedImageSize = ''.obs;
  var pickedFile;
  late TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedImageSize.value = 'Insert image';
  }

  void getImage(ImageSource imageSource) async {
    pickedFile = await ImagePicker().getImage(source: imageSource);
    selectedImagePath.value = pickedFile.path;
    selectedImageSize.value =
        (File(selectedImagePath.value).lengthSync() / 1024 / 1024)
                .toStringAsFixed(2) +
            "MB";
  }

  Future<void> sendRequest() async{
    print("called");
    if (pickedFile != null) {
      Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(descriptionController.value.text);
      print(selectedItem.value);
      print(selectedImagePath.value);
      print(position.latitude);
      print(position.longitude);
    } else {
      Get.snackbar("error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[300],
          margin: EdgeInsets.only(bottom: 5),
          colorText: Colors.white);
    }
  }
}
