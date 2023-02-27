import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/home.controller.dart';
import '../utils/card.form.dart';
import '../utils/global.color.dart';

class HomeScreen extends GetView<HomeController> {
  var _HomeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: GlobalColor.cardColor,
            title: Text(
              "Services ",
              style: TextStyle(
                  color: GlobalColor.buttonColor,
                  fontSize: 30,
                  //fontFamily: 'brandon',
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              Container(
                  margin: EdgeInsets.only(right: 10, bottom: 5),
                  child: IconButton(
                    icon: Icon(
                      LineIcons.userCircleAlt,
                      size: 40,
                      color: GlobalColor.buttonColor,
                    ),
                    onPressed: () {
                      Get.to(ProfilScreen());
                    },
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
             
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(35.537096, 6.109608), zoom: 14),
                      markers: {
                        Marker(
                            markerId: MarkerId('demi'),
                            position: LatLng(35.537096, 6.109608))
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                GridView.count(
                        physics: ScrollPhysics(),
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children:controller.list.map((e) => controller.displayData(e)).toList()
                      )

              ],
            ),
          )),
    );
  }
}
