import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/routes_manager/route_generator.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/features/on_boarding/splash_screen.dart';

import 'features/auth/presentation/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Markti',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}


