import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/screens/type.view.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/company.controller.dart';
import '../model/storage.dart';
import '../utils/global.color.dart';


class CompanyScreen extends GetView<CompanyController> {
  final companyController = Get.put(CompanyController());
  final data = Get.put(Data());

  final _services = ["doctor", "farmer", "pharmacies", "painter"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Card(
          child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(right: 345, top: 10),
            child: RawMaterialButton(
              onPressed: () {
                Get.off(() => UserTypeScreen());
              },
              elevation: 2.0,
              fillColor: Colors.white,
              child: Icon(LineIcons.arrowLeft, size: 25),
              shape: CircleBorder(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: Text(
              "Company Profil",
              style: TextStyle(
                  fontSize: 35,
                  color: GlobalColor.buttonColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Fill text fields with your company "
              "information please",
              style: TextStyle(
                  fontSize: 17,
                  color: GlobalColor.textColor,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  onChanged: (value) {},
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    hintText: "First Name",
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
            height: 15,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  onChanged: (value) {},
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    hintText: "Second Name",
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
            height: 15,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  onChanged: (value) {},
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Personal Phone',
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
            height: 15,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  controller: controller.cName,
                  onChanged: (value) {
                    if (value.length > 4) {
                      controller.validName.value = true;
                    } else {
                      controller.validName.value = false;
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
            height: 15,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  controller: controller.cPhone,
                  onChanged: (value) {
                    if (value.length == 10) {
                      if (value.startsWith('07') ||
                          value.startsWith('05') ||
                          value.startsWith('06')) {
                        controller.validPhone.value = true;
                      }
                    } else {
                      controller.validPhone.value = false;
                    }
                  },
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    suffix: Text('+213'),
                    suffixStyle: TextStyle(fontSize: 17),
                    hintText: 'Company Phone',
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
            height: 15,
          ),
          SizedBox(
            width: 360,
            height: 70,
            child: DropdownButtonFormField(
              elevation: 0,
              // value: _selectedValue,
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
                color: Color.fromARGB(255, 219, 221, 222),
                size: 40,
              ),
              dropdownColor: Color.fromARGB(255, 212, 225, 232),
              decoration: InputDecoration(
                hintText: 'Service Type',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintStyle: TextStyle(
                    height: 1, fontSize: 20, color: GlobalColor.buttonColor),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  controller: controller.cAddress,
                  onChanged: (value) {},
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Address of your company',
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
            height: 15,
          ),
          SizedBox(
            width: 360,
            child: Center(
              child: Container(
                child: TextFormField(
                  controller: controller.cDescription,
                  maxLines: 2,
                  onChanged: (value) {},
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Describe your company',
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
          InkWell(
            onTap: () async {
              await controller.companyForm();
              //  print('hello')
            },
            child: Container(
              alignment: Alignment.center,
              height: 55,
              decoration: BoxDecoration(
                color: GlobalColor.buttonColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Validate',
                style: TextStyle(
                    color: GlobalColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    ));
  }
}
