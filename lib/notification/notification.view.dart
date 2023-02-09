import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lgali/utils/global.color.dart';

import 'notification.controller.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4, top: 2),
                child: Text('Notifications',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontFamily: 'Nunito',
                        fontSize: 27,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                margin: EdgeInsets.only(right: 4, top: 2),
                child: InkWell(
                  onTap: () {
                    print('hello wolrd');
                  },
                  child: Icon(
                    Icons.new_label,
                    size: 37,
                    color: GlobalColor.mainColor,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
