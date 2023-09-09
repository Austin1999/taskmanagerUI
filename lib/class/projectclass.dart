import 'package:flutter/material.dart';

class Projects {
  String title;
  double percent;
  String date;
  String sharedby;
  Color percentcolor;
  Projects(
      {required this.date,
      required this.percent,
      required this.sharedby,
      required this.percentcolor,
      required this.title});
}
