import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../controllers/displayCompanyInfo.controller.dart';
import '../shared/global.color.dart';
import '../shared/textFieldCustom.dart';

class DisplayCompanyInfoScreen extends StatelessWidget {
  DisplayCompanyInfoController controller =
      Get.put(DisplayCompanyInfoController());
  List<String> medicalServicesList = [
    'Doctor',
    'Pharmacy',
    'Veterinary',
    'Nurse',
    'Dentist',
    'Psychologist'
  ];

  late String img;

  /*  DisplayCompanyInfoScreen() {
    img = controller.type.value;
    print(controller.type.value);
    print(img);
  } */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: GlobalColor.redColor,
        leading: BackButton(color: GlobalColor.cardColor),
        title: Text(
          "Profil",
          style: TextStyle(
              color: GlobalColor.cardColor,
              fontSize: 30,

              //fontFamily: 'brandon',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Obx(
                () => CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        "assets/images/persons/${controller.type.value}.jpg")),
              ),
            ),
            SizedBox(height: 10),
            Obx(() {
              if (controller.values.value.isEmpty)
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
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.values.value
                          .map((e) => CustomField(e))
                          .toList(),
                    ),
                  ),
                );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: InkWell(
                    onTap: () => {print('Demand')},
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: GlobalColor.yellow,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: /*  Text(
                        'Demand',
                        style: TextStyle(
                            color: GlobalColor.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23),
                      ), */
                            Icon(Icons.send_rounded)),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: InkWell(
                    onTap: () => {print('call')},
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: GlobalColor.greenNotification,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: /* Text(
                        'Call',
                        style: TextStyle(
                            color: GlobalColor.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23),
                      ), */
                            Icon(Icons.phone_forwarded_rounded)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
