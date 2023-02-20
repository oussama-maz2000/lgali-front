import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lgali/request/request.controller.dart';
import 'package:lgali/request/request.view.dart';
import 'package:lgali/utils/global.color.dart';
import 'package:line_icons/line_icons.dart';

class NewRequestView extends GetView<RequestController> {
  final _requestController = Get.put(RequestController());
  final _services = ["doctor", "farmer", "pharmacies", "painter"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
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
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Which service you want ?",
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Card(
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
                            controller.selectedItem.value = value!;
                          },

                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Color.fromARGB(255, 219, 221, 222),
                            size: 40,
                          ),
                          dropdownColor: GlobalColor.validColor,
                          decoration: InputDecoration(
                            hintText: 'Service Type',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(
                                height: 1,
                                fontSize: 20,
                                color: GlobalColor.buttonColor),
                          ),
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
                          controller: controller.descriptionController,
                          maxLines: 2,
                          onChanged: (value) {},
                          style: TextStyle(fontSize: 23),
                          decoration: InputDecoration(
                            hintText: 'Describe your problem',
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
                        child: InkWell(
                          onTap: () {
                            controller.getImage(ImageSource.camera);
                          },
                          child: Obx(
                            () => Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 360,
                              decoration: BoxDecoration(
                                color: GlobalColor.textColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                controller.selectedImageSize.value,
                                style: TextStyle(
                                    color: GlobalColor.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 240,
                  ),
                  InkWell(
                    onTap: () async {
                      await controller.sendRequest();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 250,
                      decoration: BoxDecoration(
                        color: GlobalColor.greenColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Send',
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
          ),
        ]),
      ),
    );
  }
}
