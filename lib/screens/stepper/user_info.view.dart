import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/stepper/user_type.view.dart';
import 'package:lgali/shared/custom_snack_bar.dart';
import '../../controllers/stepper/user_info.controller.dart';
import '../../shared/global.color.dart';

class UserInfoScreen extends GetView<UserInfoController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UserInfoController());
    final controller = Get.find<UserInfoController>();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "User Profil",
                style: TextStyle(
                  fontSize: 30,
                  color: GlobalColor.buttonColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Please enter your information to validate your profile",
                style: TextStyle(fontSize: 18, color: GlobalColor.textColor),
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
                    width: MediaQuery.of(context).size.width - 30,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          controller: controller.firstName,
                          onChanged: (value) {
                            if (value.length > 2) {
                              controller.firstNameValid.value = true;
                            } else {
                              controller.firstNameValid.value = false;
                            }
                          },
                          style: TextStyle(
                            fontSize: 23,
                          ),
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
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          controller: controller.lastName,
                          onChanged: (value) {
                            if (value.length > 2) {
                              controller.lastNameValid.value = true;
                            } else {
                              controller.lastNameValid.value = false;
                            }
                          },
                          style: TextStyle(fontSize: 23),
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
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Center(
                      child: Container(
                        child: TextFormField(
                          controller: controller.phone,
                          onChanged: (value) {
                            if (value.length == 10) {
                              if (value.startsWith('07') ||
                                  value.startsWith('05') ||
                                  value.startsWith('06')) {
                                controller.phoneValid.value = true;
                              }
                            } else {
                              controller.phoneValid.value = false;
                            }
                          },
                          style: TextStyle(fontSize: 23),
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
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 490,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controller.firstNameValid.value &&
                        controller.lastNameValid.value &&
                        controller.phoneValid.value) {
                      Get.to(() => UserTypeScreen());
                    } else {
                      CustomSnackBar(
                          "Error",
                          "invalid form try correctly please",
                          GlobalColor.redColor);
                    }
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalColor.buttonColor,
                    textStyle:
                        TextStyle(color: GlobalColor.cardColor, fontSize: 17),
                    fixedSize: Size(90, 40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    ));
  }
}
