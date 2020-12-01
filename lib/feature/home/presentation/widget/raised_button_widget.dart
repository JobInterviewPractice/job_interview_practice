import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  HomePageButton({this.buttonName, this.pathName});
  final String buttonName;
  final String pathName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: 180,
        height: 70,
        child: RaisedButton(
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 20),
          ),
          color: Colors.teal.shade200,
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.of(context).pushNamed(pathName);
          },
        ),
      ),
    );
  }
}
