import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/display_request_companies_controller.dart';

class DisplayCompaniesRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DisplayCompaniesRequestController());
    final controller = Get.find<DisplayCompaniesRequestController>();
    return Container(
      child: Text('hello world'),
    );
  }
}
