import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lgali/screens/home.view.dart';
import 'package:lgali/shared/global.color.dart';
import 'package:line_icons/line_icons.dart';

import '../screens/profil.view.dart';

class TabBarTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          backgroundColor: GlobalColor.cardColor,
          title: Text(
            "Home ",
            style: TextStyle(
                color: GlobalColor.blackNew,
                fontSize: 30,
                //fontFamily: 'brandon',
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10, bottom: 5),
                child: IconButton(
                  icon: Icon(
                    LineIcons.userCircleAlt,
                    size: 40,
                    color: GlobalColor.blackNew,
                  ),
                  onPressed: () {
                    Get.to(()=>ProfilScreen());
                  },
                )),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: GlobalColor.cardColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: TabBar(
                      indicator: BoxDecoration(
                          color: GlobalColor.blackNew,
                          borderRadius: BorderRadius.circular(20)),
                      labelColor: GlobalColor.white,
                      unselectedLabelColor: GlobalColor.blackNew,
                      tabs: [
                        Tab(
                          text: 'Services',
                        ),
                        Tab(
                          text: 'Requests',
                        )
                      ]),
                ),
                 Expanded(
                    child: TabBarView(
                  children: [
                    Container(
                      child:HomeScreen(),
                    ),
                    Center(
                      child: Text("Status Pages"),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}

