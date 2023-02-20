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
import 'package:line_icons/line_icons.dart';

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
                CameraPosition(target: LatLng(35.537096, 6.109608), zoom: 15),
          ),

          Positioned(
            left: 1,
            right: 1,
            bottom: 2,
            child: Container(
              child: InkWell(
                onTap: () => {Get.off(() => NewRequestView())},
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                    color: GlobalColor.buttonColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Create Request',
                    style: TextStyle(
                        color: GlobalColor.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 23),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
