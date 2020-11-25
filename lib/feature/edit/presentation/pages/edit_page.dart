import 'package:flutter/material.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Edit'),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('戻る'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
