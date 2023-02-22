import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/controllers/stepper.controller.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/global.color.dart';

final countList = List<int>.generate(5, (index) => index);

Function? onNext() {
  final StepperController controller = Get.put(StepperController());
  ((controller.currentStep.value + 1) != 5)
      ? controller.currentStep.value += 1
      : controller.complete.value = true;
}

class StepperScreen extends StatelessWidget {
  final controller = Get.put(StepperController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Obx(
          () => Stepper(
            type: StepperType.horizontal,
            elevation: 0,
            currentStep: controller.currentStep.value,
            steps: controller.buildStep(),
            onStepContinue: () {
              if (controller.currentStep.value == controller.buildStep().length-1) {
                print('validation complete');
              }
              else  controller.currentStep.value++;

            },
            onStepCancel: () {
              if (controller.currentStep.value > 0) {
                controller.currentStep.value--;
              }
            },
            onStepTapped: (index){
              controller.currentStep.value=index;
            },
          ),
        ),
      ),
    ));
  }
}
