import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'global.color.dart';

class Loading<T> extends StatelessWidget {
T nextPage;
Loading(this.nextPage);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Get.to(() => nextPage);
    });
    return Scaffold(
        body: Center(
      child: Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height/2,),
        Container(
          child: CircularProgressIndicator(
            color: Colors.greenAccent,
            backgroundColor: GlobalColor.buttonColor,
          ),
        ),
      ]),
    ));
  }
}
