import 'package:flutter/foundation.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashCheckerState extends SplashState {
  final bool isSignIn;
  SplashCheckerState(this.isSignIn);
}
