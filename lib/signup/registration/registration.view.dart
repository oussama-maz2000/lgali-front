import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/signup/registration/register.controller.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:line_icons/line_icons.dart';

class RegistrationView extends GetView<RegistrationController> {
  final _controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 345, top: 10),
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
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: Text(
                "User Profil",
                style: TextStyle(
                  fontSize: 35,
                  color: GlobalColor.buttonColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your information to validate your profile",
              style: TextStyle(
                fontSize: 16,
                color: GlobalColor.textColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20),
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
                          controller: controller.firstNameController,
                          onChanged: (value) {
                            if (value.length > 3) {
                              controller.fNameValid.value = true;
                            } else {
                              controller.fNameValid.value = false;
                            }
                          },
                          style: TextStyle(
                            fontSize: 23,
                          ),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'First Name',
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
                          controller: controller.lastNameController,
                          onChanged: (value) {
                            if (value.length > 3) {
                              controller.lNameValid.value = true;
                            } else {
                              controller.lNameValid.value = false;
                            }
                          },
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
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
                          controller: controller.phoneController,
                          onChanged: (value) {
                            if (value.length == 10) {
                              if (value.startsWith('07') ||
                                  value.startsWith('05') ||
                                  value.startsWith('06')) {
                                controller.phoneIsValid.value = true;
                              }
                            } else {
                              controller.phoneIsValid.value = false;
                            }
                          },
                          style: TextStyle(fontSize: 23),
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            suffix: Text('+213'),
                            suffixStyle: TextStyle(fontSize: 17),
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
                  InkWell(
                    onTap: () => {controller.validationForm()},
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 250,
                      decoration: BoxDecoration(
                        color: GlobalColor.buttonColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            color: GlobalColor.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ));
  }
}
