import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  String apptitle = 'Get The Job!';

  MyAppBar({this.apptitle})
      : super(
          backgroundColor: Colors.teal,
          title: Text(
            'Get The Job!',
            style: TextStyle(fontSize: 20),
          ),
        );
}
