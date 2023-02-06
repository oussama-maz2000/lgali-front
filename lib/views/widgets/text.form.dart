import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final Function? checkString;
  TextForm({
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
    this.checkString,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 7)
          ]),
      child: TextFormField(
        validator: (value) {
          checkString!(value);
        },
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            hintStyle: TextStyle(height: 1)),
      ),
    );
  }
}
