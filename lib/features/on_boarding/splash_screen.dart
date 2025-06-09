import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes_manager/routes.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer timer = Timer(const Duration(seconds: 3),(){
      Navigator.pushNamed(context, Routes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.splash, width: 200, height: 200),
            ],
          )
        ],
      ),
    );
  }
}
