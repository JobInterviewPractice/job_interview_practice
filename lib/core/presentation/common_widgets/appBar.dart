import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String appBarTitle;

  MyAppBar({this.appBarTitle = 'Get The Job!'})
      : super(
          backgroundColor: Colors.teal,
          title: Text(
            'Get The Job!',
            style: TextStyle(fontSize: 20),
          ),
        );
}
