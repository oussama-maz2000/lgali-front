import 'package:flutter/material.dart';
import 'global.color.dart';

class Circular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        Center(
            child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            color: Colors.amber[600],
            strokeWidth: 3,
          ),
        )),
      ],
    );
  }
}
