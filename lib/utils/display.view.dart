// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global.color.dart';

class DisplayCompany extends StatelessWidget {
  List<String> medicalServicesList = [
    'Doctor',
    'Pharmacy',
    'Veterinary',
    'Nurse',
    'Dentist',
    'Psychologist'
  ];

  late Map e;

  DisplayCompany(this.e);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width-20,
          margin: EdgeInsets.only(right: 3, left: 3),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(width: 0.4, color: Colors.grey),
              color: GlobalColor.cardColor,
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      medicalServicesList.contains(e['company_service'])
                          ? AssetImage('assets/images/dct.png')
                          : AssetImage('assets/images/pro.png'),
                ),
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
                              color: GlobalColor.buttonColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600))),
                  SizedBox(
                    height: 1,
                  ),
                  Text(e['company_name'],
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: GlobalColor.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500))),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(e['company_phone'],
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: GlobalColor.buttonColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500))),
                      SizedBox(
                        width: 120,
                      ),
                      Text('4.6K',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: CupertinoColors.systemYellow,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
