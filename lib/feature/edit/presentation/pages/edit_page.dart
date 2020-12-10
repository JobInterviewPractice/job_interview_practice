import 'package:flutter/material.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';

class EditPage extends StatelessWidget {
  Map<String, List<String>> _dropDownMenu = {
    'new': ['IT', 'finance'],
    'popularity': ['IT', 'finance'],
  };
  String _selectedKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBarTitle: 'EDIT'),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              DropdownButton<String>(
                value: _selectedKey,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                elevation: 16,
                style: TextStyle(fontSize: 20, color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (newValue) {
                  setState(() {
                    _selectedKey = newValue;
                  });
                },
                items: _dropDownMenu.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
