// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/displayCompanyInfo.controller.dart';
import '../screens/displayCompanyInfo.view.dart';
import 'global.color.dart';

class DisplayCompany extends StatelessWidget {
  List<String> medicalServicesList = [
    'doctor',
    'pharmacie',
    'veterinarian',
    'babysitter'
        'dentist',
    'mechanic',
    'plumber',
    'lawyer'
  ];

  late Map e;
  late String img;
  DisplayCompany(this.e) {
    img = e['company_service'];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  DisplayCompanyInfoController.state(e['user_id']);
        Get.to(() => DisplayCompanyInfoScreen(), arguments: e['user_id']);
      },
      child: Column(
        children: [
          SizedBox(
            height: 3,
          ),
          Container(
            height: 75,
            width: MediaQuery.of(context).size.width - 15,
            margin: EdgeInsets.only(right: 3, left: 3),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(width: 0.4, color: Colors.grey),
                color: GlobalColor.colorCardHome,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage("assets/images/persons/$img.jpg")),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e['company_service'],
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: GlobalColor.cardColor,
                                fontSize: 22,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.w600))),
                    SizedBox(
                      height: 1,
                    ),
                    Text(e['company_name'],
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: GlobalColor.cardColor,
                                fontSize: 18,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.w500))),
                    SizedBox(
                      height: 2,
                    ),
                    /*  Expanded(
                      child: Row(
                        children: [
                          Text(e['company_phone'],
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: GlobalColor.blackNew,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                    ), */
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
