import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../controllers/display_request_companies.controller.dart';
import '../shared/display.view.dart';
import '../shared/global.color.dart';

class DisplayCompaniesRequestScreen
    extends GetView<DisplayCompaniesRequestController> {
  final controller = Get.put(DisplayCompaniesRequestController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: GlobalColor.redColor,
          leading: BackButton(color: GlobalColor.cardColor),
          title: Text(
            "Companies",
            style: TextStyle(
                color: GlobalColor.cardColor,
                fontSize: 30,
                //fontFamily: 'brandon',
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(child: Obx(() {
                    if (controller.companies.value.isEmpty)
                      return Center(
                          child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: GlobalColor.buttonColor,
                          strokeWidth: 3,
                        ),
                      ));
                    else
                      return SingleChildScrollView(
                        child: Column(
                          children: controller.companies.value
                              .map((e) => DisplayCompany(e))
                              .toList(),
                        ),
                      );
                  })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
