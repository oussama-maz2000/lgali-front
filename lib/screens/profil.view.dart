import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/utils/textFieldCustom.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/profil.controller.dart';
import '../utils/global.color.dart';

class ProfilScreen extends StatelessWidget {
  final controller = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  child: RawMaterialButton(
                    onPressed: () {
                      Get.back();
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(LineIcons.arrowLeft, size: 25),
                    shape: CircleBorder(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Text(
                    'Profil',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: GlobalColor.buttonColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Container(
                child: Icon(
              Icons.person_sharp,
              size: 70,
              color: GlobalColor.buttonColor,
            )),
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
                          .map((e) => CustomField(e))
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
          backgroundColor: GlobalColor.redColor,
          child: const Icon(Icons.exit_to_app_rounded),
        ),
      ),
    );
  }
}
