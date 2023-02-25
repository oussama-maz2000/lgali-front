import 'package:flutter/material.dart';

import 'global.color.dart';

class CustomField extends StatelessWidget {
  String? value;
  CustomField(this.value) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      child: Center(
        child: Container(
          child: TextFormField(
            enabled: false,
            style: TextStyle(
              fontSize: 23,
            ),
            decoration: InputDecoration(
              hintText: value,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintStyle: TextStyle(
                  height: 1, fontSize: 20, color: GlobalColor.buttonColor),
            ),
            keyboardType: TextInputType.name,
          ),
        ),
      ),
    );
  }
}
