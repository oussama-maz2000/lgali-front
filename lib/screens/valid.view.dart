import 'package:flutter/material.dart';
import 'package:lgali/utils/global.color.dart';

class ValidScreen extends StatelessWidget {
  const ValidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'App description',
                style: TextStyle(
                    color: GlobalColor.mainColor,
                    fontSize: 35,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "lgali it's simple application that allow you to subscribe as simple user or like pro user which means"
                  " that if you are simple user you will just discover the service that you want and send request if you need "
                  "something , and with pro user you will offer your service in our application and the users will find you "
                  "plus of that will contact you if they need you ",
                  style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
              ),


            ],
          ),
        ),
      ),
    ));
  }
}
