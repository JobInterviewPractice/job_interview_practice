import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_interview_practice/feature/home/presentation/home_page.dart';
import 'package:job_interview_practice/feature/login/presentation/pages/login_page.dart';
import 'package:job_interview_practice/feature/splash/presentation/bloc/bloc.dart';

import '../../../../dependencies.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: serviceLocator<SplashBloc>(),
      listenWhen: (pre, curr) => curr is SplashCheckerState && pre is! SplashCheckerState,
      listener: (context, state) {
        if (state is SplashCheckerState) {
          if (state.isSignIn) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HomePage()), (_) => false);
          } else {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginPage()), (_) => false);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}