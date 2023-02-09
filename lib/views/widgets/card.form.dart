import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:lgali/notification/notification.view.dart';
import 'package:lgali/utils/global.color.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NotificationScreen());
      },
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    GlobalColor.mainColor,
                    Color.fromARGB(255, 116, 133, 142)
                  ]),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Oussama',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.05),
              ),
              SizedBox(height: 3),
              Text(
                'mazeghrane',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.05),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '0673719090',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.05),
              ),
              SizedBox(height: 10),
              Text(
                'Doctor',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.05),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '40',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
