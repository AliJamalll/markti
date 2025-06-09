import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:markti/core/routes_manager/routes.dart';

import '../../core/resources/assets_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.blue,
        ),
        skipTextButton: Text('Skip'),
        trailing: Text('Login'),
        centerBackground: true,
        onFinish: () {
          Navigator.pushReplacementNamed(context, Routes.signIn);
        },
        background: [
          Image.asset(ImageAssets.onboarding1),
          Image.asset(ImageAssets.onboarding2),
          Image.asset(ImageAssets.onboarding3),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Welcome to Marketi'),
                SizedBox(
                  height: 44,
                ),
                Text("Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Easy to Buy'),
                SizedBox(
                  height: 44,
                ),
                Text("Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Start exploring now and experience the convenience of online shopping at its best.'),
              ],
            ),
          ),
        ],
      );

  }
}
