import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lgali/screens/profil.view.dart';
import 'package:lgali/shared/categories.view.dart';
import 'package:lgali/shared/display.view.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/home.controller.dart';
import '../shared/global.color.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  //var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: GlobalColor.redColor,
        title: Text(
          "Home",
          style: TextStyle(
              color: GlobalColor.cardColor,
              fontSize: 30,
              //fontFamily: 'brandon',
              fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10, bottom: 5),
              child: IconButton(
                icon: Icon(
                  Icons.place_outlined,
                  size: 30,
                  color: Colors.amber[600],
                ),
                onPressed: () {
                  controller.updateLocation();
                },
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Oxygen',
                      color: GlobalColor.buttonColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Categories(),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Recommended',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Oxygen',
                      color: GlobalColor.buttonColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Obx(() {
                if (controller.myList.value.isEmpty)
                  return Center(
                      child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.amber[600],
                      strokeWidth: 3,
                    ),
                  ));
                else
                  return SingleChildScrollView(
                    child: Column(
                      children: controller.myList.value
                          .map((e) => DisplayCompany(e))
                          .toList(),
                    ),
                  );
              }),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [mydraw()],
          ),
        )),
      ),
    );
  }

  Widget mydraw() {
    return Container();
  }
}
