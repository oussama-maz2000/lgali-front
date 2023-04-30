import 'package:flutter/material.dart';

import 'global.color.dart';

class CustomField extends StatelessWidget {
  String value;
  CustomField(this.value) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width - 10,
          child: Center(
            child: Container(
              child: TextFormField(
                enabled: false,
                style: TextStyle(
                  fontSize: 23,
                ),
                decoration: InputDecoration(
                  hintText: value,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintStyle: TextStyle(
                      fontFamily: 'Oxygen',
                      height: 1,
                      fontSize: 20,
                      color: GlobalColor.buttonColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
