import 'package:flutter/material.dart';
import 'package:job_interview_practice/feature/home/presentation/widget/raised_button_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("GET JOB!!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              Image.asset('images/getjob1.png'),
              Padding(padding: EdgeInsets.all(30)),
              HomePageButton(
                buttonName: "Start",
                pathName: "/start_page",
              ),
              HomePageButton(
                buttonName: "Setting",
                pathName: "/setting_page",
              ),
              HomePageButton(
                buttonName: "Questions",
                pathName: "/edit_page",
              ),
              HomePageButton(
                buttonName: "Recordings",
                pathName: "/recordings_page",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
