import 'dart:io';

import 'package:hrapp/Utils/shared_pref_helper.dart';
import 'package:hrapp/models/app_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hrapp/view/loginScreen/login.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'Utils/app_color.dart';
import 'my_app.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
Future<void> main() async {

  HttpOverrides.global = MyHttpOverrides();


  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  WidgetsFlutterBinding.ensureInitialized();
  await initAppModel();
  await initMyApp();

}

Future<void> initAppModel() async {
  await AppHelper().init();
  AppHelper().updateSystemUiOverLayStyle(primaryColor, Brightness.dark);
  return Future.value();
}

Future<void> initMyApp() async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  await SentryFlutter.init(
        (options) {
      options.dsn =
      '';

      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp( MyApp(
        startWidget: LoginWidget())),
  );
}
