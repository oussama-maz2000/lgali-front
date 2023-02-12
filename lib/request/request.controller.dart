import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RequestController extends GetxController {
  static const String google_api_key =
      "AIzaSyDS49TdZt6CC3DLj5WdIycGxGfar6YU04A";
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "MB";
    } else {
      Get.snackbar("error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[300],
          colorText: Colors.white);
    }
  }
}
