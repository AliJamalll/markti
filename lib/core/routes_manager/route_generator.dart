import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/features/main_layout/presentation/pages/brand_page.dart';
import 'package:markti/features/main_layout/presentation/pages/buy_again_page.dart';
import 'package:markti/features/main_layout/presentation/pages/check_out_page.dart';
import 'package:markti/features/main_layout/presentation/pages/home_page.dart';
import 'package:markti/features/main_layout/presentation/pages/popular_products.dart';
import 'package:markti/features/on_boarding/on_boarding_screen.dart';
import 'package:markti/features/on_boarding/splash_screen.dart';
import 'package:markti/mian_layout.dart';

import '../../features/auth/presentation/pages/congratulations_screen.dart';
import '../../features/auth/presentation/pages/create_new_password_screen.dart';
import '../../features/auth/presentation/pages/forget_password_by_email_screen.dart';
import '../../features/auth/presentation/pages/forget_password_by_phone_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/register_screen.dart';
import '../../features/auth/presentation/pages/verify_email_code_screen.dart';
import '../../features/auth/presentation/pages/verify_phone_code_screen.dart';
import '../../features/main_layout/presentation/pages/categories_page.dart';

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
        return MaterialPageRoute(builder: (_) => RegisterScreen());

    // case Routes.forgetPasswordPhone:
    // return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());

      case Routes.forgetPasswordEmail:
        return MaterialPageRoute(builder: (_) => ForgetPasswordByEmailScreen());

      case Routes.code:
        final email = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => VerifyEmailCodeScreen(email: email),
        );


      case Routes.CreateNewPassword:
        final email = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => CreateNewPasswordScreen(email: email!));

      case Routes.Congratulations:
        return MaterialPageRoute(builder: (_) => CongratulationsScreen());

      case Routes.mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());

    // case Routes.homePage:
    // return MaterialPageRoute(builder: (_) => HomePage());

      case Routes.popular_products:
        return MaterialPageRoute(builder: (_) => PopularProducts());

        case Routes.categories:
        return MaterialPageRoute(builder: (_) => CategoriesPage());

        case Routes.brands:
        return MaterialPageRoute(builder: (_) => BrandPage());

        case Routes.buyAgain:
        return MaterialPageRoute(builder: (_) => BuyAgainPage());

        case Routes.checkOut:
        return MaterialPageRoute(builder: (_) => CheckOutPage());

    // case Routes.searchPage:
    // return MaterialPageRoute(builder: (_) => SearchPage());

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