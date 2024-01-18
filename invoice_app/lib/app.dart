import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_app/config/app_config.dart';
import 'package:invoice_app/config/theme/dark/dark_theme.dart';
import 'package:invoice_app/injection/di.dart';
import 'package:invoice_app/navigation/app_router.dart';
import 'package:invoice_app/presentation/utilities/constant/app_constant.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppConstant.deviceWidth, AppConstant.deviceHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: AppConfig.appName,
        darkTheme: darkThemeData,
        themeMode: ThemeMode.dark,
        routerConfig: getIt<AppRouter>().config(),
      ),
    );
  }
}
