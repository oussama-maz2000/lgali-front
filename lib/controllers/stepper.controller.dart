import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:selectable_container/selectable_container.dart';

import '../utils/global.color.dart';

class StepperController extends GetxController {
  var currentStep = 0.obs;
  var complete = false.obs;

  void onNext() {
    ((currentStep.value + 1) != 5)
        ? currentStep.value += 1
        : complete.value = true;
  }

  void onPrevious() {
    if (currentStep.value > 0) {
      currentStep.value -= 1;
    }
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text(
            "Profil",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: register(),
          isActive: currentStep.value >= 0),
      Step(
          title: Text(
            "Type",
            style: TextStyle(color: GlobalColor.buttonColor),
          ),
          content: profilType(),
          isActive: currentStep.value >= 1),
    ];
  }

  Widget register() {
    return Container(
        child: Column(
      children: [
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
                      //controller: controller.firstNameController,
                      onChanged: (value) {
                        if (value.length > 3) {
                          //controller.fNameValid.value = true;
                        } else {
                          //controller.fNameValid.value = false;
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
                      //controller: controller.lastNameController,
                      onChanged: (value) {
                        if (value.length > 3) {
                          //controller.lNameValid.value = true;
                        } else {
                          //controller.lNameValid.value = false;
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
                      //controller: controller.phoneController,
                      onChanged: (value) {
                        if (value.length == 10) {
                          if (value.startsWith('07') ||
                              value.startsWith('05') ||
                              value.startsWith('06')) {
                            //controller.phoneIsValid.value = true;
                          }
                        } else {
                          //controller.phoneIsValid.value = false;
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
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    ));
  }

  Widget profilType() {
    return Container(
        child: Column(children: [
      SizedBox(
        height: 10,
      ),
      Container(
          child: Text(
        "Type of Account",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: GlobalColor.buttonColor),
      )),
      SizedBox(
        height: 6,
      ),
      Container(
          margin: EdgeInsets.only(left: 25),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Choose the type of your account, be careful to change it impossible',
              style: TextStyle(fontSize: 18, color: GlobalColor.textColor),
            ),
          )),
      SelectableContainer(
          selected: false,
          onValueChanged: (value) {
            print('clicked');
          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              elevation: 0,
              color: GlobalColor.cardColor,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/prt.png'),
                radius: 45,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'I am a particular',
                  style: TextStyle(
                      color: GlobalColor.buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Find a service online, access',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  ' companies and more',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )
          ])),
      SizedBox(
        height: 20,
      ),
      SelectableContainer(
          selected: true,
          onValueChanged: (value) {
            print('clicked');
          },
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Card(
              elevation: 0,
              color: GlobalColor.cardColor,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/pro.png'),
                radius: 45,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'I am a professional',
                  style: TextStyle(
                      color: GlobalColor.buttonColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'The easiest way to raise',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  ' your service online',
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
              ],
            )
          ])),
    ]));
  }
}
