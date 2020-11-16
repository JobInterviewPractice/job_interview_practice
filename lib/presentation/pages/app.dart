import 'package:flutter/material.dart';
import 'package:job_interview_practice/presentation/pages/home.dart';
import 'package:job_interview_practice/presentation/pages/start.dart';
import 'package:job_interview_practice/presentation/pages/setting.dart';
import 'package:job_interview_practice/presentation/pages/edit.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get The Job',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Get the job!',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePage(),
          ),
        ),
      ),
      routes: <String, WidgetBuilder> {
        '/start_page': (BuildContext context) => StartPage(),
        '/edit_page': (BuildContext context) => EditPage(),
        '/setting_page': (BuildContext context) => SettingPage(),
      },
    );
  }
}
