import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/app.dart';
import 'package:invoice_app/config/app_config.dart';
import 'package:invoice_app/config/observer/bloc_observer.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppConfig.getInstance().init();
    Bloc.observer = MyBlocObserver();
    runApp(
      const MyApp(),
    );
  }, (error, stack) {
    debugPrint(error.toString());
  });
}
