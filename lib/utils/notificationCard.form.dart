import 'package:flutter/material.dart';
import 'package:lgali/utils/global.color.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {

        },
        child: Card(
          elevation: 2,
          child: Column(children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person.jpeg'),
              ),
              title: Text(
                'Oussama Mazeghrane',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    color: GlobalColor.mainColor),
              ),
              trailing: Text('doctor',style: TextStyle(fontSize: 15),),
              subtitle: Text('accepted your service at 13:10'),
            ),
          ]),
        ),
      ),
    );
  }
}
