import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgali/shared/custom_snack_bar.dart';
import 'package:lgali/shared/global.color.dart';

import '../screens/display_request_companies.view.dart';

class CardNotification extends StatelessWidget {
  Map element;
  late String img;
  CardNotification(this.element) {
    /*  print('from card notification');
    print(element); */
    img = element['serviceType'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: InkWell(
        onTap: () {
          if (element['cluster'] > -1) {
            Get.to(() => DisplayCompaniesRequestScreen(), arguments: [
              element['id'],
              element['cluster'],
              element['serviceType']
            ]);
          } else {
            CustomSnackBar(
                "Research",
                "We are searching for companies please wait ",
                Colors.lightBlueAccent);
          }
        },
        child: Card(
          color:
              element['cluster'] != -1 ? GlobalColor.yellow : GlobalColor.mauve,
          child: Column(children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/jobs/$img.jpg'),
              ),
              title: Text(
                element['serviceType'],
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    color: GlobalColor.cardColor),
              ),
              trailing: Text(
                element['cluster'] == -1 ? 'Pending' : 'Clustered',
                style: TextStyle(fontSize: 13, color: GlobalColor.cardColor),
              ),
              subtitle: Text(''),
            ),
          ]),
        ),
      ),
    );
  }
}
