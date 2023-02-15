import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RequestController extends GetxController {
  static const String google_api_key =
      "AIzaSyDS49TdZt6CC3DLj5WdIycGxGfar6YU04A";
  var selectedImagePath = ''.obs;
  var selectedItem = ''.obs;
  late TextEditingController descriptionController = TextEditingController();

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar("error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[300],
          margin: EdgeInsets.only(bottom: 5),
          colorText: Colors.white);
    }
  }
}
