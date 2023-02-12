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

class NewRequestView extends GetView<RequestController> {
  final _requestController = Get.put(RequestController());
  final _services = ["doctor", "farmer", "pharmacie", "painter"];
  String? _selectedValue = "";

  _NewRequestViewState() {
    _selectedValue = _services[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Which service you want ?",
            style: TextStyle(
                color: GlobalColor.textColor,
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
          leading: BackButton(
            color: GlobalColor.mainColor,
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: DropdownButtonFormField(
                    elevation: 0,
                    // value: _selectedValue,
                    items: _services
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {},
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.blueGrey,
                      size: 40,
                    ),
                    dropdownColor: Color.fromARGB(255, 212, 225, 232),
                    decoration: InputDecoration(
                      hintText: "service type",
                      labelStyle: TextStyle(
                          color: GlobalColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  width: 320,
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "description",
                        labelStyle: TextStyle(
                            color: GlobalColor.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Obx(() => controller.selectedImagePath.value == ''
                    ? Text(
                        'select image from camera/galery',
                        style: TextStyle(fontSize: 15),
                      )
                    : Card(
                        color: Colors.white,
                        elevation: 0,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: Image.file(
                              File(controller.selectedImagePath.value)),
                        ))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => {controller.getImage(ImageSource.gallery)},
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: GlobalColor.mainColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Galery',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {controller.getImage(ImageSource.camera)},
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: GlobalColor.mainColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'Camera',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
              ),
              Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[300]),
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
