import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed("/start_page"),
              child: Text(
                'Start',
              ),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed("/edit_page"),
              child: Text(
                'Edit',
              ),
            ),
            RaisedButton(
              textColor: Color(0xFF6200EE),
              onPressed: ()  => Navigator.of(context).pushNamed("/setting_page"),
              child: Text("Setting"),
            )
          ],
        ),
      ),
    );
  }
}