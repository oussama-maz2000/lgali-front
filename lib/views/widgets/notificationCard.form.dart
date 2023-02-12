import 'package:flutter/material.dart';
import 'package:lgali/utils/global.color.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          print('hello world');
        },
        child: Card(
          elevation: 0,
          child: Column(children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/person.jpeg'),
              ),
              title: Text(
                'Oussama Mazeghrane',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Nunito',
                    color: GlobalColor.mainColor),
              ),
              trailing: Text('doctor'),
              subtitle: Text('accepted your service at 13:10'),
            ),
          ]),
        ),
      ),
    );
  }
}
