import 'package:flutter/material.dart';
import 'package:job_interview_practice/presentation/pages/home.dart';
import 'package:job_interview_practice/presentation/pages/start.dart';
import 'package:job_interview_practice/presentation/pages/setting.dart';
import 'package:job_interview_practice/presentation/pages/edit.dart';
import 'package:job_interview_practice/presentation/widgets/appBar.dart';
import 'package:job_interview_practice/presentation/widgets/appBar.dart';

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
        appBar: MyAppBar(),
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
