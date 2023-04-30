import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/dashbord.view.dart';
import 'package:lgali/screens/stepper/term.view.dart';

import '../../controllers/stepper/company_info.controller.dart';
import '../../shared/custom_snack_bar.dart';
import '../../shared/global.color.dart';
import '../../shared/theme/app_theme.dart';

class CompanyInfoScreen extends StatelessWidget {
  final _services = [
    "doctor",
    "babysitter",
    "pharmacie",
    'detist'
        'plumber',
    'veterinarian',
    'lawyer'
        'mechanic'
  ];
    final controller = Get.put(CompanyInfoController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Company Profil",
              style: TextStyle(
                fontSize: 30,
                color: AppTheme.title2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.center,
            child: Text(
              "Please enter your information to "
              "validate your                        company",
              style: TextStyle(
                fontSize: 18,
                color: GlobalColor.textColor,
                fontFamily: 'Oxygen',
              ),
            ),
          ),
          SizedBox(height: 30),
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
                        controller: controller.companyName,
                        onChanged: (value) {
                          if (value.length > 3) {
                            controller.companyNameValid.value = true;
                          } else {
                            controller.companyNameValid.value = false;
                          }
                        },
                        style: TextStyle(
                          fontSize: 23,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Company Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintStyle: TextStyle(
                              fontFamily: 'Oxygen',
                              fontSize: 18,
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
                        controller: controller.companyPhone,
                        onChanged: (value) {
                          if (value.length == 10) {
                            if (value.startsWith('07') ||
                                value.startsWith('05') ||
                                value.startsWith('06')) {
                              controller.companyPhoneValid.value = true;
                            }
                          } else {
                            controller.companyPhoneValid.value = false;
                          }
                        },
                        style: TextStyle(fontSize: 23),
                        decoration: InputDecoration(
                          hintText: 'Company Phone Number',
                          suffix: Text('+213'),
                          suffixStyle: TextStyle(fontSize: 17),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintStyle: TextStyle(
                              fontFamily: 'Oxygen',
                              fontSize: 18,
                              color: GlobalColor.buttonColor),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: DropdownButtonFormField(
                    elevation: 0,
                    items: _services
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 23,
                                    color: GlobalColor.buttonColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.selected.value = value!;
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: GlobalColor.buttonColor,
                      size: 30,
                    ),
                    dropdownColor: GlobalColor.cardColor,
                    decoration: InputDecoration(
                      hintText: 'Company Type',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(
                          fontFamily: 'Oxygen',
                          fontSize: 18,
                          color: GlobalColor.buttonColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 550,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                 // Get.back();
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff136AFB),
                  textStyle:
                      TextStyle(color: GlobalColor.cardColor, fontSize: 17),
                  fixedSize: Size(90, 40),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.companyNameValid.value &&
                      controller.companyPhoneValid.value &&
                      controller.selected.value.length > 2) {
                    controller.setDataHive();
                    Get.off(() => TermsScreen());
                  } else {
                    CustomSnackBar("Error", "invalid form try correctly please",
                        GlobalColor.redColor);
                  }
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff136AFB),
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
    ));
  }
}
