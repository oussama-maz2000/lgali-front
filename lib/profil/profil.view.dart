import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lgali/information/user/user.controller.dart';
import 'package:lgali/profil/profil.controller.dart';

import 'package:lgali/utils/global.color.dart';
import 'package:line_icons/line_icons.dart';

class ProfilView extends GetView<ProfilController> {
  final _controlleur = Get.put(ProfilController());

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
                 margin: EdgeInsets.only(left:80),
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
            SizedBox(height: 20,),
            Container(
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/person.jpeg')),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 0,
              color: GlobalColor.cardColor,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  SizedBox(
                    width: 360,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          enabled: false,
                          onChanged: (value) {},
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: controller.fname,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: GlobalColor.buttonColor),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 360,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          enabled: false,
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: controller.lname,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: GlobalColor.buttonColor),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 360,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          enabled: false,
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: controller.phone,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: GlobalColor.buttonColor),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: 360,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          enabled: false,
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: controller.email,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: GlobalColor.buttonColor),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  InkWell(
                    onTap: () => {controller.signOut()},
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 280,
                      decoration: BoxDecoration(
                        color: GlobalColor.redColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Log out',
                        style: TextStyle(
                            color: GlobalColor.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
