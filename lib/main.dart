import 'package:flutter/material.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/main/presentation/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(MyApp());
}
