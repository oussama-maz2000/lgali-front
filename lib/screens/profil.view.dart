import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/shared/textFieldCustom.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/profil.controller.dart';
import '../shared/global.color.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfilController());
    final controller = Get.find<ProfilController>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: GlobalColor.redColor,
          title: Text(
            "Profil",
            style: TextStyle(
                color: GlobalColor.cardColor,
                fontSize: 30,
                //fontFamily: 'brandon',
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Container(
              child: Obx(
                () => CircleAvatar(
                  radius: 30,
                  backgroundImage: controller.type.value != ''
                      ? AssetImage(
                          'assets/images/jobs/${controller.type.value}.jpg')
                      : AssetImage('assets/images/prt.png'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              if (controller.values.value.isEmpty)
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
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.values.value
                          .map((e) => CustomField(e.toString()))
                          .toList(),
                    ),
                  ),
                );
            }),
            SizedBox(
              height: 20,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.signOut();
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(Icons.exit_to_app_rounded),
        ),
      ),
    );
  }
}
