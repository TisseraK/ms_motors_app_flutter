import 'package:flutter/material.dart';
import 'package:ms_motors_app_flutter/constantColor.dart';

Widget appBarMsMotors(var _h, var _w) {
  return Container(
    height: _h * 0.15,
    padding: EdgeInsets.only(top: _h * 0.05),
    width: _w,
    decoration: BoxDecoration(color: black),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: _h * 0.10,
          width: _h * 0.10,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/fonts/logo.png'))),
        )
      ],
    ),
  );
}
