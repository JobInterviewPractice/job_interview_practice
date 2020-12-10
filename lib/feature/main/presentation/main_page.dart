import 'package:flutter/material.dart';
import 'package:job_interview_practice/core/presentation/common_widgets/appBar.dart';
import 'package:job_interview_practice/feature/edit/presentation/pages/edit_page.dart';
import 'package:job_interview_practice/feature/home/presentation/home_page.dart';
import 'package:job_interview_practice/feature/login/presentation/pages/sign_up_page.dart';
import 'package:job_interview_practice/feature/recordings/presentation/pages/recordings_page.dart';
import 'package:job_interview_practice/feature/setting/presentation/pages/setting_page.dart';
import 'package:job_interview_practice/feature/splash/presentation/pages/splash_page.dart';
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/start_page':
            return _material(StartPage());
          case '/edit_page':
            return _material(EditPage());
          case '/setting_page':
            return _material(SettingPage());
          case '/recordings_page':
            return _material(RecordingsPage());
          case '/home_page':
            return _material(HomePage());
          case '/sign_up_page':
            return _material(SignUpPage());
          case '/':
            return _material(SplashPage());
          default:
            throw Exception("Cannot find page");
        }
      },
    );
  }

  static MaterialPageRoute _material(dynamic it) => MaterialPageRoute(builder: (_) => it);
}
