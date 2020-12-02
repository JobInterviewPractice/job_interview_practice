import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String appBarTitle;

  MyAppBar({this.appBarTitle})
      : super(
          backgroundColor: Colors.teal,
          title: Text(
            appBarTitle,
            style: TextStyle(fontSize: 20),
          ),
        );
}
