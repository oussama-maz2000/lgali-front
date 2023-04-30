import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import '../controllers/request.controller.dart';
import '../shared/circularProgress.view.dart';
import '../shared/global.color.dart';

class NewRequestScreen extends GetView<RequestController> {
  final _requestController = Get.put(RequestController());
  final _services = [
    "doctor",
    "babysitter",
    "pharmacie",
    "dentist",
    'veterinarian',
    'lawyer',
    'mechanic',
    'plumber'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(color: GlobalColor.cardColor),
          automaticallyImplyLeading: false,
          backgroundColor: GlobalColor.redColor,
          centerTitle: true,
          title: Text(
            "Search",
            style: TextStyle(
                color: GlobalColor.cardColor,
                fontSize: 30,
                //fontFamily: 'brandon',
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Which service you want ?",
              style: TextStyle(
                  color: GlobalColor.textColor,
                  fontSize: 23,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Obx(() {
            if (controller.index.value == 0)
              return Container(
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
                                color: GlobalColor.buttonColor,
                                size: 30,
                              ),
                              dropdownColor: GlobalColor.cardColor,
                              decoration: InputDecoration(
                                hintText: 'Service Type',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintStyle: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Oxygen',
                                    color: GlobalColor.buttonColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              );
            else
              return Circular();
          }),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.send_rounded,
            size: 30,
          ),
          backgroundColor: GlobalColor.greenNotification,
          onPressed: () {
            controller.sendRequest();
          },
        ),
      ),
    );
  }
}
