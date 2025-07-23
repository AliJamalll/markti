import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:markti/core/routes_manager/route_generator.dart';
import 'package:markti/core/routes_manager/routes.dart';
import 'package:markti/core/theme/theme.dart';
import 'package:markti/features/on_boarding/splash_screen.dart';
import 'core/cache/secure_storage.dart';
import 'core/my_bloc_observer/my_bloc_observer.dart';
import 'core/cache/shared_preference-utils.dart';
import 'core/di/di.dart';
import 'core/services/loading_service.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/main_layout/presentation/manager/main_layout_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferenceUtils.init();

  final storage = FlutterSecureStorage();
  String routeName;
  var token = await storage.read(key: "token");
  var isDarkStr = await storage.read(key: "isDarkMode");
  final bool isDark = isDarkStr == "true";

  if (token == null) {
    routeName = Routes.onBoarding;
  } else {
    routeName = Routes.mainLayout;
  }

  runApp(MyApp(routeName: routeName,isDarkMode: isDark,));
  configLoading();
}

class MyApp extends StatelessWidget {
  final String routeName;
  final bool isDarkMode;

  const MyApp({super.key, required this.routeName, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => BlocProvider(
        create: (_) => getIt<MainLayoutCubit>()..loadSavedTheme(isDarkMode),
        child: BlocBuilder<MainLayoutCubit, MainLayoutState>(
          builder: (context, state) {
            final isDark = state is toggleToDark;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Markti',
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: routeName,
              builder: EasyLoading.init(builder: BotToastInit()),
            );
          },
        ),
      ),
    );
  }
}


