import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/screens/test.view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/home.controller.dart';
import '../utils/global.color.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var controller = Get.put(HomeController());

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
        body: SmartRefresher(
          header: WaterDropHeader(
            waterDropColor: GlobalColor.buttonColor,
          ),
          controller: controller.refreshController,
          onRefresh: () async {
            controller.updateLocation();
          },
          enablePullDown: true,
          enablePullUp: true,
          child: SingleChildScrollView(
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
                          target: LatLng(35.537096,  6.109608),zoom: 13),
                      mapType: MapType.normal,

                      myLocationEnabled: true,
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
                Obx(() {
                  if (controller.myList.value.isEmpty)
                    return Center(
                        child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: GlobalColor.buttonColor,
                        strokeWidth: 3,
                      ),
                    ));
                  else
                    return SingleChildScrollView(
                      child: Column(
                        children: controller.myList.value
                            .map((e) => TestMap(e))
                            .toList(),
                      ),
                    );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
