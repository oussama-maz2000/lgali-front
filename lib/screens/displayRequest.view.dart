import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/displayRequest.controller.dart';

class DisplayRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DisplayRequestController());
    final controller = Get.find<DisplayRequestController>();
    return Scaffold(
      body: Text(controller.text.value),
    );
  }
}
