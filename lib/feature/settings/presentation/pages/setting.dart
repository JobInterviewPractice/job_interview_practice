import 'package:flutter/material.dart';
import 'package:job_interview_practice/data/datasources/setting_service.dart';
import 'package:job_interview_practice/feature/question/presentation/widgets/appBar.dart';

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

  AppSettingService appSettingService;
  // todo: 実装
  @override
  void initState() {
    super.initState();
    this.appSettingService = AppSettingService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
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
                          child: Text("NUMBER OF QUESTION"),
                        ),
                      ),
                      DropdownButton<int>(
                        value: appSettingService.getSetting_NumberOfQuestion(),
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (int newValue) {
                          setState(() {
                            // todo: implement
                            appSettingService
                                .setSetting_NumberOfQuestion(newValue);
                          });
                        },
                        items: <int>[10, 20, 30, 40]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
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
                          child: Text("ONLY WEEK QUESTION"),
                        ),
                      ),
                      Switch(
                        value: appSettingService.getSetting_OnlyWeakQuestion(),
                        onChanged: (value) {
                          setState(() {
                            bool newValue = value;
                            appSettingService
                                .setSetting_OnlyWeakQuestion(newValue);
                          });
                        },
                      ),
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
