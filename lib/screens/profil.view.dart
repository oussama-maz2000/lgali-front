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
              height: 20,
            ),
            Container(
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/person.jpeg')),
            ),
            SizedBox(height: 10),
            Column(
              children: controller.values.map((e) {
                return CustomField(e.toString());
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
