import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lgali/model/repository/profileRepository.dart';

import '../utils/global.color.dart';

class HomeController extends GetxController {
  final ProfileRepository _profileRepository = Get.put(ProfileRepository());
  String title = "home Screen";

  var checkGPS = false.obs;

  var list = [
    {
      "first_name": "oussama",
      "last_name": "mazeghrane",
      "phone": "0673719025",
      "type": "professional",
      "email": "loulououssama2015@gmail.com"
    },
    {
      "first_name": "oussama",
      "last_name": "mazeghrane",
      "phone": "0673719025",
      "type": "professional",
      "email": "loulououssama2015@gmail.com"
    },
    {
      "first_name": "oussama",
      "last_name": "mazeghrane",
      "phone": "0673719025",
      "type": "professional",
      "email": "loulououssama2015@gmail.com"
    },
  ];


  @override
  void onInit() async {
    super.onInit();
    List data = await _profileRepository.fetchAllUsers();

  }

  Card displayData(Map e) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  GlobalColor.validColor,
                  Color.fromARGB(255, 116, 133, 142)
                ]),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              e['first_name'],
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.05),
            ),
            SizedBox(height: 3),
            Text(
              e['last_name'],
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.05),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              e['phone'],
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.05),
            ),
            SizedBox(height: 10),
            Text(
              e['type'],
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.05),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '40',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> cheaking() async {
    bool servicestatus;
    LocationPermission permission;
    servicestatus = await Geolocator.isLocationServiceEnabled();

    if (servicestatus) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }
      checkGPS.value = true;
    } else {
      await Geolocator.openLocationSettings();
      if (servicestatus) {
        print('hello world');
      }
    }
    /* if (servicestatus && permission == LocationPermission.always) {
      checkGPS.value = true;
    } */
  }
}
