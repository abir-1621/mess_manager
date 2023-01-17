import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/shared_preferences.dart';
import '../../utils/route_names_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initSplash();
  }

  initSplash() {
    Timer(const Duration(seconds: 5), () {
      if (!SharedPrefs.isOnBoardVisited()) {
        context.pushReplacement('/${AppRouter.onBoardingScreenPath}');
      } else {
        context.pushReplacement(AppRouter.homeScreenPath);
        // context.pushReplacementNamed('otp',params: {'verificationId':"i am not"});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
