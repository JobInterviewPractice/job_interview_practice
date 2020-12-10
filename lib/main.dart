import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_interview_practice/dependencies.dart';
import 'package:job_interview_practice/feature/main/presentation/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupDependencies();
  runApp(MyApp());
}
