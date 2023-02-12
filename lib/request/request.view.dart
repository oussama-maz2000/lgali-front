import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lgali/login/login.view.dart';
import 'package:lgali/notification/notification.view.dart';
import 'package:lgali/request/newRequest.veiw.dart';
import 'package:lgali/request/request.controller.dart';
import 'package:lgali/utils/global.color.dart';

class RequestView extends StatelessWidget {
  double _length = 500;

  //var _requestController = Get.put(RequestController());
  var items = const [
    "doctor",
    "doctor",
    "doctor",
    "doctor",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(22.319103, 114.169418), zoom: 15),
          ),
          Container(
            child: InkWell(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: GlobalColor.mainColor,
                size: 32,
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
          Positioned(
            left: 1,
            right: 1,
            bottom: 2,
            child: Container(
              //margin: EdgeInsets.only(top: 470),
              height: 153,
              width: 410,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  color: Color.fromARGB(255, 233, 225, 225),
                  elevation: 0,
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        margin: EdgeInsets.only(
                          bottom: 12,
                          left: 10,
                        ),
                        child: Text(
                          "New Request ?",
                          style: TextStyle(
                              fontSize: 20,
                              color: GlobalColor.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 330,
                          height: 45,
                          child: InkWell(
                            onTap: () {
                              Get.to(NewRequestView());
                            },
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: false,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(8)),
                                  hintText: 'Description',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(height: 0.5),
                                  prefixIcon: Icon(Icons.description_rounded)),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(NewRequestView());
                        },
                        child: Center(
                          child: SizedBox(
                            width: 330,
                            height: 45,
                            child: TextFormField(
                              onTap: () {
                                Get.to(NewRequestView());
                              },
                              maxLines: 1,
                              decoration: InputDecoration(
                                  enabled: false,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(8)),
                                  hintText: 'Image',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(height: 1),
                                  prefixIcon: Icon(Icons.image)),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
