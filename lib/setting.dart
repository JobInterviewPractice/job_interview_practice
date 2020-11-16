
import 'package:flutter/material.dart';



class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _SettingPageState extends State<SettingPage> {
  String dropdownValue = '10';
  int count = 1;
      List<bool> _values = [true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: Colors.teal,
        title: Container(
          margin: EdgeInsets.only(right: 56.0),
          child: Center(
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(32.0),
                    child: FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Row(
                        children: [
                          Icon(Icons.fast_rewind),
                          Text(
                            'SETTINGS',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          child:

                          Text(
                              "NUMBER OF QUESTION"
                          ),
                        ),
                      ),
    DropdownButton<String>(
    value: dropdownValue,
    elevation: 16,
    style: TextStyle(color: Colors.deepPurple),
    underline: Container(
    height: 2,
    color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
    setState(() {
    dropdownValue = newValue;
    });
    },
    items: <String>['10', '20', '30', '40']
                .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    )

                    ],
                  ),

Row(
    children: [
    Padding(
    padding: const EdgeInsets.all(24.0),
    child: Container(
    child:
    Text(
    "ONLY WEEK QUESTION"
    ),
    ),
    ),
      Switch(value: _values[0],
          onChanged: (value){
          setState((){
           _values[0] = value;
    });})
      ],


)






                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
    }



