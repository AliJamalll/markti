import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:markti/core/routes_manager/route_generator.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/features/on_boarding/splash_screen.dart';
import 'core/cache/secure_storage.dart';
import 'core/my_bloc_observer/my_bloc_observer.dart';
import 'core/cache/shared_preference-utils.dart';
import 'core/di/di.dart';
import 'core/services/loading_service.dart';
import 'features/auth/presentation/pages/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPreferenceUtils.init();
  final storage = FlutterSecureStorage();
  String routeName;
  var token = await storage.read(key: "token");
  if(token == null){
    routeName = Routes.onBoarding;
  }else{
    routeName = Routes.homePage;
  }
  runApp( MyApp(routeName: routeName,));
  configLoading();
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.routeName});

  String routeName;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) => MaterialApp(
        home: child,
        debugShowCheckedModeBanner: false,
        title: 'Markti',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: routeName,
        builder: EasyLoading.init(
          builder: BotToastInit()
        ),
      ),
    );
  }
}


