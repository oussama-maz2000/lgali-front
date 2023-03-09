import 'package:flutter/material.dart';
import 'package:lgali/utils/global.color.dart';

class CardNotification extends StatelessWidget {
  Map element;

  CardNotification(this.element);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 5),
      child: InkWell(
        onTap: () {
          print(element['id']);
        },
        child: Card(

          color: element['cluster'] == -1
              ? GlobalColor.yellow
              : GlobalColor.greenColor,
          child: Column(children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person.jpeg'),
              ),
              title: Text(
                element['serviceType'],
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    color: GlobalColor.mainColor),
              ),
              trailing: Text(
                element['status'] == 0 ? 'Pending' : 'Clustered',
                style: TextStyle(fontSize: 13),
              ),
              subtitle: Text(element['requestDescription']),
            ),
          ]),
        ),
      ),
    );
  }
}
