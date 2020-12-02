import 'package:flutter/material.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/feature/edit/presentation/pages/edit_page.dart';
import 'package:job_interview_practice/feature/home/presentation/home_page.dart';
import 'package:job_interview_practice/feature/setting/presentation/pages/setting_page.dart';
import 'package:job_interview_practice/feature/start/presentation/pages/start_page.dart';

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
        appBar: MyAppBar(appBarTitle: "Get The Job!"),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HomePage(),
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/start_page': (BuildContext context) => StartPage(),
        '/edit_page': (BuildContext context) => EditPage(),
        '/setting_page': (BuildContext context) => SettingPage(),
      },
    );
  }
}
