import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  late TextEditingController otpCode;

  @override
  void onInit() {
    super.onInit();
otpCode=TextEditingController();
  }
}