// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {

  String? placeholder;
  Widget? suffixIcon;
  Widget? prefixIcon;
  VoidCallback? onTap;
  Function(String)? onChanged;
  TextEditingController? controller;
  bool? autofocus;
  Color? borderColor;
  Color? customColor;
  TextInputType? textInputType;

  CustomInputWidget(
      {super.key,
        this.placeholder,
        this.suffixIcon,
        this.prefixIcon,
        this.onTap,
        this.onChanged,
        this.autofocus = false,
        this.borderColor,
        this.controller,
        this.textInputType,
        this.customColor});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xFF344767),
          border: Border.all(
            color: const Color(0xFF344767),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            cursorColor: customColor,
            cursorRadius: const Radius.circular(10.0),
            cursorWidth: 10.0,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: prefixIcon,
              hintText: placeholder,
              hintStyle: TextStyle(
                color: customColor,
              ),
            ),
            style: TextStyle(
              color: customColor,
              fontWeight: FontWeight.normal,
            ),
            controller: controller,
            keyboardType: textInputType,
          ),
        ),
      ),
    );
  }

}
