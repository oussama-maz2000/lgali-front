import 'package:flutter/material.dart';
import '../utils/global.color.dart';
import '../utils/notificationCard.form.dart';

class NotificationScreen extends StatelessWidget {
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
              child: Text('Services Accepted',
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
