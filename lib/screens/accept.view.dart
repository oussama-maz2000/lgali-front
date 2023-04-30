import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/acceptRequest.controller.dart';
import '../shared/global.color.dart';
import '../shared/notificationCard.form.dart';

class AcceptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AcceptController());
    final controller = Get.find<AcceptController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: GlobalColor.redColor,
          title: Text(
            "Requests",
            style: TextStyle(
                color: GlobalColor.cardColor,
                fontSize: 30,
                //fontFamily: 'brandon',
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () => ListView(
                    children: controller.requests.value
                        .map((e) => CardNotification(e))
                        .toList()),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
