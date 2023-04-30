import 'package:flutter/material.dart';
import 'package:lgali/controllers/serviceCompany.controller.dart';
import 'package:get/get.dart';

import '../shared/global.color.dart';

class ServiceCompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ServiceCompanyController());
    final controller = Get.find<ServiceCompanyController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: GlobalColor.redColor,
        title: Text(
          "Services",
          style: TextStyle(
              color: GlobalColor.cardColor,
              fontSize: 30,
              //fontFamily: 'brandon',
              fontWeight: FontWeight.w500),
        ),
      ),
    ));
  }
}
