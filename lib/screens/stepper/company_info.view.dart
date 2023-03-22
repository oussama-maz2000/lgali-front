import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/global.color.dart';

class CompanyInfoScreen extends StatelessWidget {
  final _services = ["doctor", "farmer", "pharmacies", "painter"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                color: GlobalColor.buttonColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 35, right: 30),
            child: Text(
              "Please enter your information to "
              "validate your company",
              style: TextStyle(
                fontSize: 18,
                color: GlobalColor.textColor,
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
                        /*controller: companyNameController,
                            onChanged: (value) {
                              if (value.length > 3) {
                                companyNameValid.value = true;
                              } else {
                                companyNameValid.value = false;
                              }
                            },*/
                        style: TextStyle(
                          fontSize: 23,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Company Name',
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
                        /*controller: companyPhoneController,
                            onChanged: (value) {
                              if (value.length == 10) {
                                if (value.startsWith('07') ||
                                    value.startsWith('05') ||
                                    value.startsWith('06')) {
                                  companyPhoneValid.value = true;
                                }
                              } else {
                                companyPhoneValid.value = false;
                              }
                            },*/
                        style: TextStyle(fontSize: 23),
                        decoration: InputDecoration(
                          hintText: 'Company Phone Number',
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
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  child: DropdownButtonFormField(
                    style: TextStyle(
                        fontSize: 23,
                        color: GlobalColor.buttonColor,
                        fontWeight: FontWeight.w400),
                    elevation: 0,
                    items: _services
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 23,
                                    color: GlobalColor.cardColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              value: e ,
                            ))
                        .toList(),
                    onChanged: (value) {
                      value = value!;
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: GlobalColor.buttonColor,
                      size: 30,
                    ),
                    dropdownColor: GlobalColor.buttonColor,
                    decoration: InputDecoration(
                      hintText: 'Company Type',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle: TextStyle(
                          height: 1,
                          fontSize: 20,
                          color: GlobalColor.buttonColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 510,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Back'),
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
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {},
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
    ));
  }
}
