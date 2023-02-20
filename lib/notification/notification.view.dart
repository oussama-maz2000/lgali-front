import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lgali/request/request.view.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:lgali/views/widgets/notificationCard.form.dart';

import 'notification.controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Notifications',
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
              child: ListView(
                children: [
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                  CardNotification(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
