import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notificationRequest.controller.dart';
import '../shared/global.color.dart';
import '../shared/notificationCard.form.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NotificationController());
    final controller = Get.find<NotificationController>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Requests',
                  style: TextStyle(
                      color: GlobalColor.buttonColor,
                      fontFamily: 'Nunito',
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                ()=> ListView(
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
