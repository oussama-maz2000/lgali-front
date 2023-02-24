import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/controllers/stepper.controller.dart';
import 'package:lgali/screens/request.view.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:line_icons/line_icons.dart';

final countList = List<int>.generate(5, (index) => index);

class StepperScreen extends StatelessWidget {
  final controller = Get.put(StepperController());

  List<Step> buildStep() {
    return [
      Step(
          title: Text(
            "Profil",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: controller.userInfo(),
          isActive: controller.currentStep.value >= 0),
      Step(
          title: Text(
            "Type",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: controller.userType(),
          isActive: controller.currentStep.value >= 1),
      Step(
          title: Text(
            "Company",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: controller.companyInfo(),
          isActive: controller.currentStep.value >= 2),
      Step(
          title: Text(
            "Service",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: controller.companyTypeService(),
          isActive: controller.currentStep.value >= 3),
      Step(
          title: Text(
            "App",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: controller.descriptionApp(),
          isActive: controller.currentStep.value >= 4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Obx(() => Stepper(
              elevation: 0,
              currentStep: controller.currentStep.value,
              steps: buildStep(),
              controlsBuilder:
                  (BuildContext context, ControlsDetails controls) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: RawMaterialButton(
                          splashColor: GlobalColor.white,
                          onPressed: () {
                            if (controller.currentStep.value > 0) {
                              controller.currentStep.value--;
                            }
                          },
                          elevation: 2.0,
                          fillColor: GlobalColor.buttonColor,
                          child: Icon(
                            LineIcons.arrowLeft,
                            size: 30,
                            color: GlobalColor.white,
                          ),
                          shape: CircleBorder(),
                        ),
                      ),
                      Container(
                        child: RawMaterialButton(
                          splashColor: GlobalColor.white,
                          onPressed: () {
                            print(controller.currentStep.value);
                            if (controller.currentStep.value <
                                buildStep().length - 1) {
                              if (controller.isCompletedStep() == true) {
                                controller.currentStep.value++;
                              } else if (controller.isCompletedStep() ==
                                  false) {
                                Get.snackbar(
                                    "Error", "Invalid form , try again please",
                                    backgroundColor: Colors.redAccent,
                                    colorText: Colors.white,
                                    margin: EdgeInsets.only(
                                        bottom: 4, left: 4, right: 4),
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            } else if (controller.currentStep.value ==
                                buildStep().length - 1) {
                              print('completed');
                              Get.to(() => RequestScreen());
                            }
                          },
                          elevation: 2.0,
                          fillColor: GlobalColor.buttonColor,
                          child: Icon(
                            LineIcons.arrowRight,
                            size: 30,
                            color: GlobalColor.white,
                          ),
                          shape: CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    ));
  }
}
