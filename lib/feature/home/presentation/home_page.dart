import 'package:flutter/material.dart';
import 'package:job_interview_practice/feature/home/presentation/widget/raisedButton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Padding(padding: EdgeInsets.all(10)),
            HomePageButton(
              buttonName: "Setting",
              pathName: "/setting_page",
            ),
            Padding(padding: EdgeInsets.all(10)),
            HomePageButton(
              buttonName: "Questions",
              pathName: "/edit_page",
            ),
            Padding(padding: EdgeInsets.all(10)),
            HomePageButton(
              buttonName: "Recordings",
              pathName: "/review_page",
            ),
          ],
        ),
      ),
    );
  }
}
