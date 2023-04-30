import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/controllers/stepper/term.controller.dart';
import 'package:lgali/screens/stepper/user_info.view.dart';
import 'package:lgali/screens/stepper/user_type.view.dart';
import '../../shared/global.color.dart';
import '../../shared/theme/app_theme.dart';

class TermsScreen extends StatelessWidget {
  final controller = Get.put(TermController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Terms of Service",
                  style: TextStyle(
                    fontSize: 32,
                    color: AppTheme.title2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(color: GlobalColor.cardColor),
                child: Text(
                  "To enhance your user experience, this app requires access to your GPS location. By using your location data, the app can provide you with location-based services such as finding nearby services or suggesting local events. Rest assured that your location data will be kept private and used solely for the purpose of improving your app experience.",
                  style: TextStyle(
                      fontSize: 24,
                      color: GlobalColor.textColor,
                      fontFamily: 'Oxygen',
                      height: 1.5),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 625,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => UserInfoScreen());
                    },
                    child: Text('Back'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff136AFB),
                      textStyle:
                          TextStyle(color: GlobalColor.cardColor, fontSize: 17),
                      fixedSize: Size(90, 40),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.printdata();
                    },
                    child: Text('Accept'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff136AFB),
                      textStyle:
                          TextStyle(color: GlobalColor.cardColor, fontSize: 17),
                      fixedSize: Size(90, 40),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
