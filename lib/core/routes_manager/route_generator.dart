import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/features/on_boarding/on_boarding_screen.dart';
import 'package:markti/features/on_boarding/splash_screen.dart';

import '../../features/auth/presentation/pages/login_screen.dart';

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){

    case Routes.splash:
    return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

        case Routes.signIn:
        return MaterialPageRoute(builder: (_) => LoginScreen());

        case Routes.signUp:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      default:
        return unDefinedRoute();
    }

  }
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }

}