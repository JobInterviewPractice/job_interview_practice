import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  String apptitle;

  MyAppBar({this.apptitle}) : super(title: Text(apptitle, style: TextStyle(fontSize: 20),));

}