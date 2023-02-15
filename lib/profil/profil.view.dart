import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lgali/information/user/user.controller.dart';

import 'package:lgali/utils/global.color.dart';

class ProfilView extends GetView<UserController> {
  final _controlleur = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: GlobalColor.mainColor,
          ),
          title: Text(
            'Profil',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: GlobalColor.mainColor),
          ),
        ),
        body: Column(
          children: [
            Container(
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/person.jpeg')),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                  height: 50,
                  width: 320,
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: "Name",
                          content: Column(
                            children: [
                              SizedBox(
                                height: 35,
                                child: TextField(
                                   // controller: controller.nameController,
                                    decoration: InputDecoration(
                                        labelText: "name",
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[300]),
                                  child: Text(
                                    "confirm",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {
                                  //  controller.person.value.setName(
                                    //    controller.nameController.value.text);
                                  },
                                ),
                              )
                            ],
                          ));
                    },
                    child: TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                        //  hintText: controller.person.value.getName(),
                          labelStyle: TextStyle(
                              color: GlobalColor.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder()),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                  height: 50,
                  width: 320,
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: "Email",
                          content: Column(
                            children: [
                              SizedBox(
                                height: 35,
                                child: TextField(
                                    decoration: InputDecoration(
                                        labelText: "email",
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 112, 197, 116)),
                                  child: Text(
                                    "confirm",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ));
                    },
                    child: TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                     //     hintText: controller.person.value.email,
                          labelStyle: TextStyle(
                              color: GlobalColor.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder()),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                  height: 50,
                  width: 320,
                  child: InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: "phone",
                          content: Column(
                            children: [
                              SizedBox(
                                height: 35,
                                child: TextField(
                                    decoration: InputDecoration(
                                        labelText: "phone",
                                        border: OutlineInputBorder())),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[300]),
                                  child: Text(
                                    "confirm",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ));
                    },
                    child: TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: "0677889933",
                          labelStyle: TextStyle(
                              color: GlobalColor.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          border: OutlineInputBorder()),
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: 320,
                child: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                        title: "change password",
                        content: Column(
                          children: [
                            SizedBox(
                              height: 35,
                              child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'password',
                                      border: OutlineInputBorder())),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[300]),
                                child: Text(
                                  "confirm",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ));
                  },
                  child: TextField(
                    textAlign: TextAlign.center,
                    enabled: false,
                    decoration: InputDecoration(
                    //    hintText: controller.person.value.email,
                        labelStyle: TextStyle(
                            color: GlobalColor.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 165,
            ),
            Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400]),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 225, 221, 221)),
                  ),
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
